
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
				<li><g:link controller="personStudy" action="show" id="${id}">${message(code: 'resume.label', default: 'Resume')}</g:link></li>
			</ul>
		</div>
		<div id="quit-study" class="content">
			<p>You have selected to quit the current study, which means that you no longer want to participate. 
			If you do not intend to quit the study, select the "Resume" button above to return to the study.</p>
			<p>If you do intend to quit the study, please let us know why in the box below:</p>
			
			<g:form method="post" action="quit" id="${id}">
				<table width="300">
				<tr><td><g:textArea name="reason" required="true" rows="20" cols="200"/></td></tr>
				<tr><td><g:actionSubmit class="save" action="quit" value="${message(code: 'default.button.submit.label', default: 'Submit')}" /></td></tr>
				</table>
			</g:form>
		</div>
		</body>
</html>
