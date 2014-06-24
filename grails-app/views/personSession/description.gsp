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
		<div id="new-session" class="content scaffold-create" role="main">
		
			<p>Before we show you some results, we want to know more about what you are searching for.</p>
			
			<p>Imagine that someone else will evaluate the results on your behalf.  In the text box below,
			provide a detailed description of your target item and any criteria someone else could use
			to determine whether a particular result matches your query. If applicable, provide the 
			full author name(s) and full title of the item. Additional details might include a specific
			edition or copy, year of publication, publisher, translator, etc.
			</p>
			
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
			<g:form action="description" id="${id}">
				<div id="search" style="margin-left: 40px; margin-top: 30px">
				<table style="width: 90%">
				<tr><td>You searched for: "${query}"</td></tr>			
				<tr>
					<td><g:textArea name="description" style="width: 400px; height: 200px" required="true"/></td>
					<td>
					<p>For example:</p>
					<p><i>I am searching for the short story The Lady With the Pet Dog by Anton Chekhov.
					Any instance of this story from any collection of Chekhov's works will suffice.</i></p>
					<p><i>I am searching for the 1931 Three Siren's Press edition of J.K. Huysman's Against the Grain.</i>

					</td>
				</tr>					
				<tr><td colspan="2">
				<p>What type of item are you searching for?</p>
						<g:select name="itemType" from="${typeMap.entrySet()}" style="margin-left: 40px"
							optionKey="key" optionValue="value" required="true"/>
				</td></tr>
				<tr><td colspan="2">
					<p>How certain are you that the item is in the collection?</p>
						<ul class="likert">
							<li class="likert">Very</li>
							<li class="likert">Somewhat</li>
							<li class="likert">Not</li>
						</ul>
						<br/>
						<ul class="likert">
						<g:radioGroup name="confidence"
	              			values="['HIGH','MEDIUM','LOW']" required="true">
							<li class="likert">${it.radio}</li>
						</g:radioGroup>	
						</ul>
				</td></tr>
				
			
				<tr><td colspan="2" style="text-align: right"><g:actionSubmit class="save" action="description" value="${message(code: 'default.button.continue.label', default: 'Continue')}" /></td></tr>
				</table>
				</div>
				
			</g:form>
		</div>
	</body>
</html>
