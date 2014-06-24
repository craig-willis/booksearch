package edu.illinois.lis.solr

import groovy.json.*
import edu.illinois.lis.*
import edu.illinois.lis.ResultRating.Rating

class SearchController {
	
	def grailsApplication

	// Index page with search form and results
    def index() { 
		if (!params.q?.trim()) {
			return [:]
		}
		
		def solrUrl = grailsApplication.config.grails.solr.url
		
		def sessionId = params.sessionId
		def sessionInstance = Session.get(sessionId)
		def studyId = sessionInstance.getStudy().id
		def query = params.q
		def offset = params.offset
		if (!offset) offset = 0
		def max = params.max
		if (!max) max = 10
		int page = offset.toInteger()/max.toInteger();
		
		def search = new Search(session: sessionInstance, queryString: query, timestamp: new Date())
		search.save	()
		[sessionId: sessionId, query: query, studyId: studyId]
		
		println query
			
		withHttp(uri: solrUrl) {
			def json = get(path: "/solr/htrc/select/", query: [q: query, wt: "json", start: offset, rows: max])
			def slurper = new JsonSlurper()
			def result = slurper.parseText(json.getText())

			int position = 0;				
			for (doc in result.response.docs) {
				http://localhost:8983/htweb/page?volumeId=uc1.b88347&pageId=UCAL_B88347_00000039
				withHttp(uri: solrUrl) {
					def text = get(path: "/htweb/page", query: [volumeId: doc.volumeId, pageId: doc.pageNum ])
					doc.text = text.getText().replaceAll("\n", "<br/>")
					
					def searchResult = new SearchResult(session: sessionInstance, docId:doc.id, 
						volumeId: doc.volumeId, volumePageNum: doc.pageNum, resultsPage: page,
						position: position);
					searchResult.save() 
					position++; 
				}
			}
			
			println result.response.numFound
			println result.response.start
			println result.response.docs.size()
			return [searchResult: result.response, sessionId: sessionId, studyId: studyId]
		}
	}
	
	def rate() {
		String sessionId = params.sessionId
		String docId = params.docId
		String comment = params.comment
		String r = params.rating
		Rating rating = Rating.valueOf(params.rating)
		SearchResult result = SearchResult.findByDocId(docId)
		
		ResultRating resultRating = ResultRating.findByResult(result)
		if (resultRating) {
			resultRating.setRating(rating)
			resultRating.setComment(comment)
		} else {
			resultRating = new ResultRating(result:result, rating: rating, comment: comment)
		}
		resultRating.save()
	}
	def q() {
		String query = params.q
		println query
		def solrUrl = grailsApplication.config.grails.solr.url
		
		withHttp(uri: solrUrl) {
			def json = get(path: "/solr/htrc/select/", query: [q: query, wt: "json"])
			def slurper = new JsonSlurper()
			def result = slurper.parseText(json.getText())
			
			println result.response.numFound
			println result.response.start
			println result.response.docs.size()
		}
		render view: 'index'
	}
}
