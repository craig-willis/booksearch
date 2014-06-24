
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
				<li><g:link controller="study1" action="index" id="${id}">Back</g:link></li>
				<li><g:link controller="personSession" action="list" params="${[studyId:id]}">${message(code: 'study1.next.label', default: 'Next')}</g:link></li>
			</ul>
		</div>
		<div id="study1-intro" class="content">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<b>Collection description</b>	
			<p>The collection you will be searching consists of page-level 
			<a href="http://en.wikipedia.org/wiki/Optical_character_recognition" target="_new">OCR</a> of nearly 2 million
			<a href="http://en.wikipedia.org/wiki/Public_domain" target="_new">public-domain</a> English-language volumes.
			Although volume-level information is included (for example, author, title, publication date), 
			it is important to note that you will be searching a collection of <strong>pages</strong>,
			not a collection of volumes.
			
			Aside from government publications and modern re-printings of public-domain works, the majority
			of volumes in the collection were published before 1923.</p>
			
			<table style="border: none; width:80%">
			<tr>
			<td>
				<g:img uri="/images/pd_decades.png" style="width: 400px; border: 1px solid black"/>
			</td>
			<td>
			<table style="width: 200px; border: none; margin-top: 20px">
			<tr><td><a href="http://en.wikipedia.org/wiki/Monograph" target="_new">Monographs</a></td><td>1,285,643</td></tr>
			<tr><td><a href="http://en.wikipedia.org/wiki/Periodical_publication" target="_new">Serials/periodicals</a></td><td>534,343</td></tr>
			<tr><td>Notated music</td><td>2,847</td></tr>
			</table>
			</table>
			<h3>Monographs</h3>			
			<p>Monographs include non-fiction, fiction, poetry, drama, speeches, novels, essays, dictionaries,
			encyclopedias, catalogs, as well as a variety of government publications</p>
			
			<h3>Serials</h3>
			<p>Serials or periodicals include materials that are published on a regular schedule.  This includes
			journals, newspapers, reports, yearbooks including government publications.</p>
		</div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="study1" action="index" id="${id}">Back</g:link></li>
				<li><g:link controller="personSession" action="list" params="${[studyId:id]}">${message(code: 'study1.next.label', default: 'Next')}</g:link></li>
				<li style="float:right"><g:link controller="personStudy" action="quit" id="${id}">${message(code: 'study1.quit.label', default: 'Quit study')}</g:link></li>
				<li style="float:right"><g:link controller="logout" action="index">${message(code: 'study1.saveAndExit.label', default: 'Save & Exit')}</g:link></li>
			</ul>
		</div>
	</body>
</html>
