package edu.illinois.lis

class SearchResult {

	Session session
	String docId
	String volumeId
	String volumePageNum
	int resultsPage
	int position
	String query

		
    static constraints = {
		session(nullable: true)
		query(nullable: true)
    }
}
