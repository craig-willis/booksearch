package edu.illinois.lis

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder


class PersonStudy implements Serializable  {

	enum Status {
		NOT_STARTED,
		STARTED,
		COMPLETE,
		QUIT
	}
	Person person
	Study study
	Date startDate
	Date endDate
	Status status
	String quitReason
	
	static constraints = {
		startDate(nullable: true)
		endDate(nullable: true)
		quitReason(nullable: true)
	}
	
	boolean equals(other) {
		if (!(other instanceof PersonStudy)) {
			return false
		}

		other.person?.id == person?.id &&
			other.study?.id == study?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (person) builder.append(person.id)
		if (study) builder.append(study.id)
		builder.toHashCode()
	}

	static PersonStudy get(long personId, long studyId) {
		find 'from PersonStudy where person.id=:personId and study.id=:studyId',
			[personId: personId, studyId: studyId]
	}

	static PersonStudy create(Person person, Study study, boolean flush = false) {
		new PersonStudy(person: person, study: study).save(flush: flush, insert: true)
	}

	static boolean remove(Person person, Study study, boolean flush = false) {
		PersonStudy instance = PersonStudy.findByPersonAndStudy(person, study)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Person person) {
		executeUpdate 'DELETE FROM PersonStudy WHERE person=:person', [person: person]
	}

	static void removeAll(Study study) {
		executeUpdate 'DELETE FROM PersonStudy WHERE study=:study', [study: study]
	}

	static mapping = {
		id composite: ['study', 'person']
		version false
	}
}
