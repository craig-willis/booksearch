import java.util.Date;

import edu.illinois.lis.*

class BootStrap {
	transient springSecurityService

    def init = { servletContext ->
		def adminAuth = new Authority(authority: 'ROLE_ADMIN').save(flush: true)
		def userAuth = new Authority(authority: 'ROLE_USER').save(flush: true)

		def admin = new Person(username: 'admin',
			password: springSecurityService.encodePassword('admin'), enabled: true).save(flush: true)
		def adminRole = new PersonAuthority(person: admin, authority: adminAuth)
			adminRole.save();
			
		def person = new Person(username: 'cwillis', email: 'cawillis@gmail.com',
			password: springSecurityService.encodePassword('test123!'), enabled: true).save(flush: true)
		def study = new Study(name: 'Book search', description: 'How users search in a collection of books', 
			consentController: 'consent', studyController: 'study1', startDate: new Date(), endDate: new Date()+14)
			study.save(flush: true)
		def personStudy = new PersonStudy(person: person, study: study, 
			status: PersonStudy.Status.NOT_STARTED)
			personStudy.save(flush: true)
    }
    def destroy = {
		
		
		def person = Person.findByUsername('cwillis')
		person.remove()
		
		def study = Study.findByName('Test study')
		study.remove()
		
    }
}
