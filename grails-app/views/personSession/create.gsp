<%@ page import="edu.illinois.lis.Session" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="study1" action="collection" id="${id}" target="_new">Collection description</g:link></li>
			</ul>
		</div>
		<div id="new-session" class="content scaffold-create" role="main">
			<h1>Search session (${sessionInstanceTotal} of ${maxSessions})</h1>
			
			<g:if test="${sessionInstanceTotal == 1}">
			<p>In this study, you will be asked to conduct a series of searches. Please read the instructions for each search.</p>
			</g:if>		
			
			<p><b>Instructions</b></p>
			<g:if test="${sessionInstanceTotal == 1}">
			<p>Think of an item that you know exists and believe might be in the collection.</p> 
			<p>An <i>item</i> can be anything you want, as long you are already familiar with it. It
			might be a book (including specific editions), journal, article, play, speech, poem, report,
			chapter, etc. It is not important that the item actually exists in the collection. Remember, the works in this 
			collection were generally published before 1923.</p>
			</g:if>

			<g:if test="${sessionInstanceTotal == 2}">
			<p>This time, search for something that you know is a <b>complete volume</b>. For example, a specific
			book, report, or journal. Remember, the works in this 
			collection were generally published before 1923.</p>
			</g:if>	
						
			<g:if test="${sessionInstanceTotal == 3}">
			<p>This time, search for something that you know is <b>part of a volume</b>. For example, a poem, play (or act), 
			short story, article, book chapter, speech, essay, or letter. Remember, the works in this 
			collection were generally published before 1923.</p>
			</g:if>	
			
			<g:if test="${sessionInstanceTotal == 4}">
			<p>This time, search for an item that you know is <b>non-fiction</b>.  This could be a complete 
			volume or part of a volume (journal, article, essay, speech, letter, etc). Remember, the works in this 
			collection were generally published before 1923.
			</p>
			</g:if>

			<g:if test="${sessionInstanceTotal == 5}">
			<p>This time, search for <b>a specific edition</b> of an item that you know has multiple editions.
			Remember, the works in this collection were generally published before 1923.
			</p>
			</g:if>
		
			<p>Search for this item using the the search box below.</p>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${sessionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sessionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="search" id="${studyId}">
				<div id="search" style="margin-left: 40px; margin-top: 30px">
				<g:textField name="query" size="70"/>
				<g:hiddenField name="seq" value="${sessionInstanceTotal}"/>
				<g:actionSubmit class="save" value="${message(code: 'default.button.Search.label', default: 'Search')}" />
				</div>		
			</g:form>
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li style="float:right"><g:link controller="personStudy" action="quit" id="${id}">${message(code: 'study1.quit.label', default: 'Quit study')}</g:link></li>
				<li style="float:right"><g:link controller="logout" action="index">${message(code: 'study1.saveAndExit.label', default: 'Save & Exit')}</g:link></li>
			</ul>
		</div>		
	</body>
</html>
