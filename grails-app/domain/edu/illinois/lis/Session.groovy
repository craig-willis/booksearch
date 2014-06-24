package edu.illinois.lis



class Session {

	Person person
	Study study
	Date startTime
	Date endTime
	String queryString
	String description
	String revisedDescription
	Likert confidence
	String itemType
	int seq
		
	enum Likert {
		HIGH,
		MEDIUM,
		LOW,
	}
	
    static constraints = {
		endTime(nullable: true)
		queryString(nullable: true)
		description(nullable: true)
		confidence(nullable: true)
		itemType(nullable: true)
		revisedDescription(nullable: true)
		seq(nullable:true)
    }
}
