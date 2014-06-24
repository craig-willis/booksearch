package edu.illinois.lis

class SessionSurvey {

	Session session
	String comment
	String pageLevel
	String difficulty
	int volumeTitle
	int itemTitle
	int toc
	int internalPage
	int bibPage
	int indexPage
	
    static constraints = {
		comment(nullable: true)
		volumeTitle(nullable: true)
		itemTitle(nullable: true)
		toc(nullable: true)
		internalPage(nullable: true)
		bibPage(nullable: true)
		indexPage(nullable: true)
    }
}
