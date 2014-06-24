
<%@ page import="edu.illinois.lis.Session" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<g:if test="${sessionInstanceTotal < maxSessions}">
					<li><g:link action="create" params="${[studyId:studyId]}">Start a new search</g:link></li>
				</g:if>
				<g:if test="${sessionInstanceTotal == maxSessions}">
					<li><g:link controller="personStudy" action="complete" params="${[studyId:studyId]}">Done</g:link></li>
				</g:if>			
			</ul>
		</div>
		<div id="list-session" class="content scaffold-list" role="main">
			<h1>Your search sessions (${sessionInstanceTotal} of ${maxSessions})</h1>
			
			<g:if test="${sessionInstanceTotal == maxSessions}">
			<p>You've completed the study. Thanks for your help!  Select the "Done" link above.</p>
			</g:if>
			
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="query" title="${message(code: 'session.query.label', default: 'Query')}" />
						<g:sortableColumn property="startTime" title="${message(code: 'session.startTime.label', default: 'Started')}" />
						<g:sortableColumn property="endTime" title="${message(code: 'session.endTime.label', default: 'Ended')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${sessionInstanceList}" status="i" var="sessionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: sessionInstance, field: "queryString")}</td>							
						<td><g:formatDate date="${sessionInstance.startTime}" /></td>	
						<td><g:formatDate date="${sessionInstance.endTime}" /></td>	
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="logout" action="index">${message(code: 'study1.saveAndExit.label', default: 'Save & Exit')}</g:link></li>
				<li><g:link controller="personStudy" action="quit" id="${id}">${message(code: 'study1.quit.label', default: 'Quit study')}</g:link></li>	
			</ul>
		</div>		
	</body>
</html>
