package test

import edu.illinois.lis.*

class Study1Controller {

	def springSecurityService
	
    def index(Long id) 
	{ 
		def user = springSecurityService.getCurrentUser()
		def study = Study.get(id)
		Set<Session> sessions = Session.findAllByPersonAndStudy(user, study)
		if (sessions && sessions.size() > 0) {
			redirect(controller: 'personSession', action: 'list', params: [studyId: id])
		}
		else {	
			[id: id]
		}
	}
	
	def collection(Long id)
	{
		[id: id]
	}
	
	def newSession(Long id) 
	{
			
	}
}
