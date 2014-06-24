package edu.illinois.lis

class ResultRating {

	enum Rating {
		EXACT,
		CLOSE,
		RELATED,
		ABOUT,
		NOT_RELEVANT
	}
	
    static constraints = {
    }
	
	SearchResult result
	Rating rating
	String comment
	
}
