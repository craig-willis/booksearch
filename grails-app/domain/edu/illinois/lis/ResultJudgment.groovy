package edu.illinois.lis

class ResultJudgment {

	/*
	 *  Nav This page represents a home page of an entity directly named by the query; 
	 *  		the user may be searching for this specific page or site.
	 *  Key This page or site is dedicated to the topic; authoritative and comprehensive, 
	 *  		it is worthy of being a top result in a web search engine.
	 *  HRel The content of this page provides substantial information on the topic.
	 *  Rel The content of this page provides some information on the topic, which may be minimal; 
	 *  	the relevant information must be on that page, not just promising-looking anchor text pointing to a possibly useful page.
	 *  Non The content of this page does not provide useful information on the topic, 
	 *  	but may provide useful information on other topics, including other interpretations of the same query. 
	 *  Junk This page does not appear to be useful for any reasonable purpose; it may be spam or junk.
	 */
	enum Judgment {
		ITEM_TITLE,
		ITEM_INTERNAL,
		VOL_TITLE,
		VOL_TOC,
		VOL_INTERNAL,
		VOL_INDEX,
		OTHER
	}

    static constraints = {
    }
	
	SearchResult result
	Judgment judgment
	
}
