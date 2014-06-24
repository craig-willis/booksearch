package study


import edu.illinois.lis.*;
import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Study)
class StudyTests {

    void testSomething() {
		
		def person = new Person(username: 'test',
			password: 'test', enabled: true)
		assertNotNull person.save()
			
	   def study = new Study(name: 'Test study', description: 'Test desc',
		   consentPath: '/study1/consent', startDate: new Date(), endDate: new Date().next())
		   assertNotNull study.save()
		   assertNotNull study.id
	   def foundStudy = Study.get(study.id)
	   assertEquals 'Test study', foundStudy.name
	   	   
	   def personStudy = new PersonStudy(person: person, study: study,
		   startDate: new Date(), status: PersonStudy.Status.STARTED)
		   assertNotNull personStudy.save()
		   assertNotNull personStudy.id
		   
    }
}
