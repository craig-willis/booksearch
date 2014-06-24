package edu.illinois.lis

class ConsentController {
	def springSecurityService
	def userConsent

	def index(Long id) {
		[id: id]
	}
	
	def update(Long id) {
		def user = springSecurityService.getCurrentUser()
		def consent = Consent.findByPerson(user)
		def study = Study.get(id)
		
		def signature = params.signature
		def c1 = params.c1
		def c2 = params.c2
		def c3 = params.c3
		consent = new Consent(person: user, study: study, signature: signature,
			consent1: c1, consent2: c2, consent3: c3, dateCreated: new Date());
		consent.save();
		redirect (controller: study.studyController, action: 'index', id: study.id)
	}

	def show(Long id) {
		
		def user = springSecurityService.getCurrentUser()
		def consent = Consent.findByPerson(user)
		def study = PersonStudy.findByPerson(user).study()
				
		if (params.c) {
			def c = (params.c == "on")
			consent = new Consent(person: user, consent: c, dateCreated: new Date(), study);
			consent.save();
			redirect (controller: 'search', action: 'index')
		}
		else
		{
			if (consent && consent.isConsent()) {
				redirect (controller: 'search', action: 'index')
			}
		}
	}
}
