package edu.illinois.lis

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import edu.illinois.lis.PersonStudy.Status

class PersonStudyController {

	def springSecurityService
	
    def index() { 
		def user = springSecurityService.getCurrentUser()
		def config = SpringSecurityUtils.securityConfig
		if (user) {
			if (user.authorities.any { it.authority == "ROLE_ADMIN" }) {
				redirect (controller: 'admin')
			} else {
				//def person = Person.get(user.id)
				Set<PersonStudy> studies = user.getStudies()
				[studyList: studies, studyTotal: studies.size()]
			}
		} 
		else
		{
			redirect (controller: 'login', action: 'index')
		}
	}
	
	// Start/resume study?
	def show(Long id) {
		def user = springSecurityService.getCurrentUser()
		def study = Study.get(id)
		def personStudy = PersonStudy.findByPersonAndStudy(user, study)
		if (!personStudy) {
			flash.message = message(code: 'default.not.found.message', 
				args: [message(code: 'study.label', default: 'Study'), id])
			redirect action: "index"
			return
		}

		// Has the user consented?
		def consent = Consent.findByPerson(user)
		if (!consent) {
			redirect (controller: study.consentController, action: 'index', id: study.id)
		} else {
			redirect (controller: study.studyController, action: 'index', id: study.id)
		}
	}
	
	def complete() {
		def user = springSecurityService.getCurrentUser()
		def id = params.studyId
		def study = Study.get(id)
		def personStudy = PersonStudy.findByPersonAndStudy(user, study)
		
		if (personStudy.getStatus() != Status.COMPLETE){ 
			personStudy.setEndDate(new Date())
			personStudy.setStatus(Status.COMPLETE)
			personStudy.save()
		}
		redirect (controller: 'logout')
		
	}
	
	def quit(Long id) {
		def user = springSecurityService.getCurrentUser()
		def study = Study.get(id)
		def personStudy = PersonStudy.findByPersonAndStudy(user, study)
		if (params.reason) {
			def reason = params.reason
			personStudy.setQuitReason(reason)
			personStudy.setStatus(PersonStudy.Status.QUIT)
			personStudy.save()
			redirect (controller: 'logout', action: 'index')
		} else {
			[id: id]
		}
	}
}
