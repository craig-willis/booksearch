package edu.illinois.lis.solr

import groovy.json.*
import edu.illinois.lis.*
import edu.illinois.lis.ResultJudgment.Judgment
import edu.illinois.lis.ResultRating.Rating

class FreeSearchController {
	
	def grailsApplication

	// Index page with search form and results
    def index() { 
		if (!params.q?.trim()) {
			return [:]
		}
		
		def query = params.q
		def offset = params.offset
		if (!offset) offset = 0
		def max = params.max
		if (!max) max = 10
		int page = offset.toInteger()/max.toInteger();
		
		def solrUrl = grailsApplication.config.grails.solr.url
		
			
		withHttp(uri: solrUrl) {
			def json = get(path: "/solr/htrc/select/", query: [q: query, wt: "json", start: offset, rows: max, fl: "id, volumeId, pageNum, label, marc, seq, score"])
			def slurper = new JsonSlurper()
			def result = slurper.parseText(json.getText())

			int position = 0;				
			for (doc in result.response.docs) {
				withHttp(uri: solrUrl) {
					def text = get(path: "/htweb/page", query: [volumeId: doc.volumeId, pageId: doc.pageNum ])
					doc.text = text.getText().replaceAll("\n", "<br/>")
					
					def searchResult = new SearchResult(docId:doc.id, 
						volumeId: doc.volumeId, volumePageNum: doc.pageNum, resultsPage: page,
						position: position, query: query);
					searchResult.save() 
					position++; 
				}
			}
			
			return [searchResult: result.response]
		}
	}
	
	def rate() {
		String docId = params.docId
		String r = params.rating
		Judgment rating = Judgment.valueOf(params.rating)
		SearchResult result = SearchResult.findByDocId(docId)
		
		ResultJudgment resultJudgment = ResultJudgment.findByResult(result)
		if (resultJudgment) {
			resultJudgment.setJudgment(rating)
		} else {
			resultJudgment = new ResultJudgment(result:result, judgment: rating)
		}
		resultJudgment.save()
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
