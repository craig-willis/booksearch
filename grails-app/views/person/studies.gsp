
<%@ page import="edu.illinois.lis.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'active.studies.label', default: 'Active Studies')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-studies" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'study.name.label', default: 'Study')}" />
						<g:sortableColumn property="description" title="${message(code: 'study.description.label', default: 'Description')}" />					
						<g:sortableColumn property="startDate" title="${message(code: 'study.startDate.label', default: 'Started')}" />
						<g:sortableColumn property="endDate" title="${message(code: 'study.endDate.label', default: 'Completed')}" />	
						<g:sortableColumn property="status" title="${message(code: 'study.status.label', default: 'Status')}" />		
						<g:sortableColumn property="study.startDate" title="${message(code: 'study.startDate.label', default: 'Study Start Date')}" />
						<g:sortableColumn property="study.endDate" title="${message(code: 'study.endDate.label', default: 'Study End Date')}" />		
					</tr>
				</thead>
				<tbody>
				<g:each in="${studyList}" status="i" var="study">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="personStudy" action="show" id="${study.study.id}">${fieldValue(bean: study.study, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: study.study, field: "id")}</td>
						<td>${fieldValue(bean: study, field: "startDate")}</td>
						<td>${fieldValue(bean: study, field: "endDate")}</td>
						<td>${fieldValue(bean: study, field: "status")}</td>
						<td>${fieldValue(bean: study.study, field: "startDate")}</td>
						<td>${fieldValue(bean: study.study, field: "endDate")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studyTotal}" />
			</div>
		</div>
	</body>
</html>
