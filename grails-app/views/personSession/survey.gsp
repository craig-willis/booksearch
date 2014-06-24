<%@ page import="edu.illinois.lis.Session" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Session Survey</title>
	</head>
	<body>
		<div id="session-survey" class="content" role="main">
		
			<h1><g:message code="session.survey.label" default="Session survey"/></h1>
		
			<p> Please answer the following questions about your search session.</p>	
			<g:form action="survey" id="${sessionId}">
				<div id="survey">
					<table>
						<tr>
							<td>Did you find what you were looking for?</td>
							<td>
								<div style="width: 200px">
								<ul class="yesno">
									<g:radioGroup name="found" required="true"
              							labels="['Yes', 'No']"
              							values="[1,0]">
										<li class="yesno">${it.radio} ${it.label}</li>
									</g:radioGroup>
								</ul>
								</div>
							</td>
						</tr>						
						<tr>
							<td>How difficult was it to find your item?</td>
							<td style="border: 1px solid black" width="450px">
								<ul class="likert" style="font-size: smaller">
									<li class="likert">Very<br/>difficult</li>
									<li class="likert">Somewhat<br/>difficult</li>
									<li class="likert">Neither difficult<br/> nor easy</li>
									<li class="likert">Somewhat<br/>easy</li>
									<li class="likert">Very<br/>easy</li>
									<li class="likert">NA</li>
								</ul><br/>	
								<ul class="likert">
									<g:radioGroup name="difficulty" required="true"
              							values="[5,4,3,2,1,-1]">
										<li class="likert">${it.radio}</li>
									</g:radioGroup>
								</ul>
							</td>
						</tr>
						<tr>
							<td>Were page-level results appropriate for this item?</td>
							<td>
								<div style="width: 200px">
								<ul class="yesno">
									<g:radioGroup name="pageLevel" required="true"
              							labels="['Yes', 'No', 'NA']"
              							values="[1,0,-1]">
										<li class="yesno">${it.radio} ${it.label}</li>
									</g:radioGroup>
								</ul>
								</div>
							</td>
						</tr>			
						<tr>
							<td>Number each of the following from 1 to 6 based on the usefulness to your search (1 means you would prefer see this page at higher in the results list):</td>
							<td>
								<table>
								<tr><td><g:field type="number" name="vt" size="2" required="true"/>&nbsp;Volume title page</td></tr>
								<tr><td><g:field type="number" name="it" size="2" required="true"/>&nbsp;Item title page (if item is not a book/volume)</td></tr>
								<tr><td><g:field type="number" name="toc" size="2" required="true"/>&nbsp;Table of contents page</td></tr>
								<tr><td><g:field type="number" name="ip" size="2" required="true"/>&nbsp;Page internal to item or volume</td></tr>
								<tr><td><g:field type="number" name="bib" size="2" required="true" />&nbsp;Bibliography page</td></tr>
								<tr><td><g:field type="number" name="idx" size="2" required="true"/>&nbsp;Index page</td></tr>
								</table>
							</td>
						</tr>			
						<tr>
							<td>Please provide any comments about this search session:</td>
							<td><g:textArea name="comment"/></td>
						</tr>
						<tr><td></td><td><g:actionSubmit action="survey" value="${message(code: 'default.button.continue.label', default: 'Continue')}" /></td></tr>
					</table>
				</div>
			</g:form>
		</div>
	</body>
</html>
