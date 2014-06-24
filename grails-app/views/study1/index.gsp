
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${message(code: 'study1.label', default: 'Study 1')}</title>
	</head>
	<body>
		<a href="#study1-intro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="personStudy" action="index">Back</g:link></li>
				<li><g:link controller="study1" action="collection" id="${id}">Next</g:link></li>
			</ul>
		</div>
		<div id="study1-intro" class="content">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<b>Introduction</b>			
			<p>Thank you for agreeing to participate in this study. Your participation will help to further our understanding of how people search for information in large collections of digital books.</p>
			<p>The study will proceed as follows:
				<ul>
				<li>First, we will provide a little background about the collection that you will be searching.</li>
				<li>Next, we will ask you to conduct a series of 5 searches.</li>
				<li>For each search, you will be asked to rate results and complete a brief questionnaire.</li>
				</ul>
			<p>You can exit the system and resume participation at a later time by selecting the "Save & Exit" link at the bottom of the page. You can discontinue participation at any time.  Just let us know by selecting the "Quit the study" link at the bottom of the page.</p>		
		</div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="personStudy" action="index">Back</g:link></li>
				<li><g:link controller="study1" action="collection" id="${id}">Next</g:link></li>
				<li style="float:right"><g:link controller="personStudy" action="quit" id="${id}">${message(code: 'study1.quit.label', default: 'Quit study')}</g:link></li>
				<li style="float:right"><g:link controller="logout" action="index">${message(code: 'study1.saveAndExit.label', default: 'Save & Exit')}</g:link></li>
			</ul>
		</div>
	</body>
</html>
