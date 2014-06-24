<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.codecs.MD5Codec" %>
<html>
	<head>
		
		<meta name="layout" content="main">
    <title><g:if test="${params.q && params.q?.trim() != ''}">${params.q} - </g:if>Book Search</title>
    
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("q").focus();
        }   

        $(document).ready(function() {
            var showChar = 1000;
            var ellipsestext = "...";
            var moretext = "more";
            var lesstext = "less";
            $('.more').each(function() {
                var content = $(this).html();
         
                if(content.length > showChar) {
         
                    var c = content.substr(0, showChar);
                    var h = content.substr(showChar-1, content.length - showChar);
         
                    var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
         
                    $(this).html(html);
                }
         
            });
         
            $(".morelink").click(function(){
                if($(this).hasClass("less")) {
                    $(this).removeClass("less");
                    $(this).html(moretext);
                } else {
                    $(this).addClass("less");
                    $(this).html(lesstext);
                }
                $(this).parent().prev().toggle();
                $(this).prev().toggle();
                return false;
            });
        });
             
    </script>    
    
    <style type="text/css">
      * {
        font-family: Arial, sans-serif;
        padding: 0;
        margin: 0;
      }

      body {
        font-size: 0.9em;
        padding: .5em;
      }

      #header form input {
        padding: .1em;
      }

      #header .hint {
        color: gray;
      }

      #header h1 a {
        text-decoration: none;
        font-family: Georgia, serif;
          color: dimgray;
      }

      #header h1 {
          letter-spacing: -0.1em;
          float: left;
      }

      #header h1 span {
          font-family: Georgia, serif;
          color: #424242;
      }

      #header form {
          margin-left: 22em;
          padding-top: .1em;
      }

      .title {
        margin: 1em 0;
        padding: .3em .5em;
        text-align: right;
        background-color: seashell;
        border-top: 1px solid lightblue;
      }

	  .result {
	  	margin-left: 1em;
	  	margin-bottom: 1em;	
	  }
	  
      .page {
        margin-bottom: 1em;
      }

      .result .displayLink {
        color: green;
      }

      .result .name {
        font-size: larger;
      }
      
      .text {
        text-align: left;
        background-color: seashell;
        width: 500px;
        font-size: 11px;
      }
      
      .marc {
        font-size: smaller;
        text-align: left;
        padding: 0;
        margin-left: 20px;
      }
      
      .survey {
      	font-size: smaller;
      	margin-top: 10px;
        text-align: left;
        width: 300px;
        background-color: #FFFFCC;
        border: 1px solid black;
        padding: 5px;
      }

      .paging a.step {
        padding: 0 .3em;
      }

      .paging span.currentStep {
          font-weight: bold;
      }

	  .page {
	  	vertical-align: top;
	  }
      
	table, caption, tbody, tfoot, thead, tr, th, td {
	    margin: 0;
	    padding: 0;
	    border: 0;
	    outline: 0;
	    font-size: 100%;
	    width: 90%;
	    vertical-align: baseline;
	    background: transparent;
	    bgcolor: #ffffff;
	}
	th:hover, tr:hover {
		background: #FFFFFF;
	}
	
      a {
    color: #0254EB
}
a:visited {
    color: #0254EB
}
a.morelink {
    text-decoration:none;
    outline: none;
}
.morecontent span {
    display: none;
}
.comment {
    width: 400px;
    background-color: #f0f0f0;
    margin: 10px;
}

    </style>

  </head>
  <body onload="focusQueryInput();">
	<div class="nav" role="navigation">
		<ul style="align: right">			
			<li style="float: right"><g:link controller="personSession" action="survey" params="${[studyId:studyId,sessionId:sessionId]}">Done</g:link></li>
			<!--<li><g:link controller="personSession" class="create" action="create" params="${[studyId:studyId,sessionId:sessionId]}">Start new search</g:link></li>-->
		</ul>
	</div>  
  

  <div class="content">
  	<div style="background-color: #FFFFCC; border: 1px solid black; padding: 5px" >
  	<b>Instructions</b>
  	<p>Each of the results below is a page of OCR from the collection. Beneath each page is minimal volume metadata, 
  	including author, title, and publication information.</p>
      <ul>
      	<li>Review the results below as you would the results of any search engine (only review as many as you would naturally)</li>
      	<li>Rate each of the results that you review (please select the "Rate it" button)</li>
      	<li>Refine your search in the search box, if desired</li>
      	<li>You can view the page in context by selecting "View full volume"</li>
   	    <li>Once you're done reviewing results and ready to start a new search, select the <b>"Done"</b> button above</li>   	
      </ul>
      
    </div>
    <div id="header" style="margin-top: 20px">
    <g:form action="index" method="post">
    	<g:hiddenField name="sessionId" value="${params.sessionId}" size="50"/>
        <g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Refine" />
    </g:form>
  </div>  
  </div>
  <div id="results">
    <g:set var="haveQuery" value="${params.q?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.docs}" />
    <div class="title">
      <span>
        <g:if test="${haveQuery && haveResults}">
          Showing <strong>${searchResult.start + 1}</strong> - <strong>${searchResult.docs.size() + searchResult.start}</strong> of <strong>${searchResult.numFound}</strong>
          results for <strong>${params.q}</strong>
        </g:if>
        <g:else>
        &nbsp;
        </g:else>
      </span>
    </div>

    <g:if test="${haveQuery && !haveResults && !parseException}">
      <p>Nothing matched your query - <strong>${params.q}</strong></p>
      <g:if test="${!searchResult?.suggestedQuery}">
        <p>Suggestions:</p>
        <ul>
          <li>Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
            <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
		The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
                See the plugin/Compass documentation Mapping sections for details.</em>
          </li>
        </ul>
      </g:if>
    </g:if>

    <g:if test="${parseException}">
      <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
      <p>Suggestions:</p>
    </g:if>

    <g:if test="${haveResults}">

      <div class="results">
        <g:each var="result" in="${searchResult.docs}" status="index">
        	<hr/>
        	<b>Page ${result.seq.toInteger()}</b>
        	&nbsp;-&nbsp;	<a href="http://babel.hathitrust.org/cgi/pt?id=${result.volumeId}&seq=${result.seq.toInteger()}" target="_new">View full volume</a>
        	
        	<table class="result" style="clear: both">
        	  <tr>
        		<td style="background-color: 'seashell'; vertical-align: top">
	        		
        			<div id="${result.id}" class="text content more">
	        			<%=result.text%>
        			</div>
        			<div class="marc">
	        			<b><i>From</i></b>	
        				<div style="font-size: 11px; margin-left: 20px">
	        				<%=result.marc%>
  	 		         		<div class="volumeId">Volume: ${result.volumeId}</div>
  	 		         	</div>
            		</div>
        		</td>
        		<td class="page">
            		<div class="survey" id="rating-${MD5Codec.encode(result.id)}">
					      <b>How relevant is this page to your search?</b>
					      <div style="font-size: 11px; margin-left: 20px">
					 	     <g:formRemote name="rating-${result.id}" url="[controller: 'search', action:'rate']"
					 	     	update="rating-${MD5Codec.encode(result.id)}">
					 	     	<g:hiddenField name="docId" value="${result.id}"/>
					  		    <g:hiddenField name="sessionId" value="${params.sessionId}"/>
						   		   <g:radioGroup name="rating" required="true"
              							labels="['This is exactly the item I searched for','This is close, but not exactly the item','This is about the item','This is related to the item','This is completely irrelevant']"
              							values="['EXACT','CLOSE','RELATED','ABOUT','NOT_RELEVANT']">
										${out.print(it.radio)} ${it.label}  <br/>
									</g:radioGroup>
					      	   <br>   
					      	Is there anything you would like to tell us about this result?<br/>
					      	   <g:textArea name="comment"/>	
					      	  <g:actionSubmit class="save" action="rate" value="${message(code: 'default.button.rate.label', default: 'Rate it')}" />				      
					     </g:formRemote>
					    </div>
            		</div>
        	    </td>
        	  </tr>
        	</table>
        </g:each>
      </div>

      <div>
        <div class="paging">
          <g:if test="${haveResults}">
              Page:
              <g:set var="totalPages" value="${Math.ceil(searchResult.numFound / 10)}" />
              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
              <g:else><g:paginate controller="search" action="index" params="[q: params.q, sessionId: sessionId]" total="${searchResult.numFound}" prev="&lt; previous" next="next &gt;"/></g:else>
          </g:if>
        </div>
      </div>
    </g:if>
    	<div class="nav" role="navigation">
		<ul style="align: right">			
			<li style="float: right"><g:link controller="personSession" action="survey" params="${[studyId:studyId,sessionId:sessionId]}">Done</g:link></li>
			<!--<li><g:link controller="personSession" class="create" action="create" params="${[studyId:studyId,sessionId:sessionId]}">Start new search</g:link></li>-->
		</ul>
	</div>  
  </div>
  </body>
  
 
</html>
