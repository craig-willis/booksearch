package edu.illinois.lis

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;


import org.springframework.dao.DataIntegrityViolationException
import edu.illinois.lis.PersonStudy.Status
import edu.illinois.lis.Session.Likert

// List all of the sessions for the current user
class PersonSessionController 
{

	static maxSessions = 5;
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def typeMap = [
		1: 'Book', 
		2: 'Journal', 
		3: 'Article', 
		4: 'Essay', 
		5: 'Play', 
		6: 'Short story', 
		7: 'Report', 
		8: 'Poem',
		9: 'Speech', 
		10: 'Letter', 
		11: 'Other'
	]

	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) 
	{	
		// params.max = Math.min(max ?: 10, 100)
		//  [sessionInstanceList: Session.list(params), sessionInstanceTotal: Session.count()]
		def user = springSecurityService.getCurrentUser()
		if (user) {
			def studyId = params.studyId
			def study = Study.get(studyId)
			
			Set<Session> sessions = Session.findAllByPersonAndStudy(user, study, [sort: 'startTime', order:'asc'])
			if (sessions && sessions.size() > 0) {
				[sessionInstanceList: sessions, sessionInstanceTotal: sessions.size(), studyId: studyId, maxSessions: maxSessions]
			} else {
				redirect (action: "create", params: [studyId: studyId, maxSessions: maxSessions, sessionInstanceTotal: sessions.size()+1])
			}
		}  
    }

    def create() {
		def user = springSecurityService.getCurrentUser()
		def study = Study.get(params.studyId)
		if (params.sessionId) {
			def personSession = Session.get(params.sessionId)
			personSession.setEndTime(new Date())
			personSession.save()
		}
		
		Set<Session> sessions = Session.findAllByPersonAndStudy(user, study)
		//def sessionInstance = new Session(person: user, study: study, startTime: new Date())
		//sessionInstance.save()
		[studyId: study.id, maxSessions: maxSessions, sessionInstanceTotal: sessions.size()+1]
	}

	def search(Long id) {
		def user = springSecurityService.getCurrentUser()
		def study = Study.get(id)
		def seq = params.seq
		def query = params.query
		
		def personStudy = PersonStudy.get(user.id, study.id)
		if (personStudy.getStatus() == Status.NOT_STARTED) {
			personStudy.setStatus(Status.STARTED)
			personStudy.setStartDate(new Date())
		}
		def sessionInstance = new Session(person: user, study: study, startTime: new Date(), queryString: query, seq: seq)
		sessionInstance.save()
		
		redirect(action: "description", id: sessionInstance.id, params: [query: query])
	}
	
	def description(Long id) {
		def description = params.description
		
		if (description) {			
			def sessionInstance = Session.get(id)
			def itemType = params.itemType
			Likert confidence = Likert.valueOf(params.confidence)
			
			sessionInstance.setDescription(description)
			sessionInstance.setItemType(itemType)
			sessionInstance.setConfidence(confidence)
			sessionInstance.save()
			def query = sessionInstance.getQueryString()
			
			redirect(controller: "search", params: [sessionId: id, q: query])
		}
		[id: id, query: params.query, typeMap: typeMap]
	}

    def save(Long sessionId) {
        def sessionInstance = new Session(params)
        if (!sessionInstance.save(flush: true)) {
            render(view: "create", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
    }

    def show(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        [sessionInstance: sessionInstance]
    }

    def edit(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        [sessionInstance: sessionInstance]
    }

    def update(Long id, Long version) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sessionInstance.version > version) {
                sessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'session.label', default: 'Session')] as Object[],
                          "Another user has updated this Session while you were editing")
                render(view: "edit", model: [sessionInstance: sessionInstance])
                return
            }
        }

        sessionInstance.properties = params

        if (!sessionInstance.save(flush: true)) {
            render(view: "edit", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
    }

    def delete(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        try {
            sessionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def survey(Long id) 
	{
		def user = springSecurityService.getCurrentUser()
		
		if (id) {
			def personSession = Session.get(id)
			def difficulty = params.difficulty
			def comment = params.comment
			def pageLevel = params.pageLevel
			def volumeTitle = params.vt
			def itemTitle = params.it
			def toc = params.toc
			def internalPage = params.ip
			def bibPage = params.bib
			def indexPage = params.idx
			
			SessionSurvey survey = new SessionSurvey(session: personSession, difficulty: difficulty, comment: comment, 
				pageLevel: pageLevel, volumeTitle: volumeTitle, itemTitle: itemTitle, toc: toc, internalPage: internalPage,
				bibPage: bibPage, indexPage: indexPage)		
			survey.save()
			redirect(action: 'list', params: [studyId: personSession.getStudy().id])
		} else {
			if (params.sessionId) {
				def personSession = Session.get(params.sessionId)
				personSession.setEndTime(new Date())
				personSession.save()
			}
			[sessionId: params.sessionId]
		}
	}
}
