 	package edu.illinois.lis


// Represents a study
class Study {
	
	String name
	String description
	String consentController
	String studyController
	Date startDate
	Date endDate
	
	String toString() {
		return name
	}
	
    static constraints = {
		endDate(nullable: true)
    }
}
