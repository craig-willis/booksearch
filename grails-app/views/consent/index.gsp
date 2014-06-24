<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${message(code: 'consent.title', default: 'Informed Consent')}</title>
<style>
.content { 
    margin: 20px;
	font-size: smaller;
}

.content p {
	margin: 10px;
}

.content ul {
	margin-left: 40px;
}

.signature {
	border: 1px solid black;
	margin: 10px;	
	width: 400px;
	padding: 20px;
}



</style>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="logout" action="index">${message(code: 'logout.label', default: 'Logout')}</g:link></li>
			</ul>
		</div>
		<div id="consent-text" class="content">
		<g:form method="post" action="update" id="${id}">
		
<h2>Informed Consent</h2>
<p>You are in invited to participate in this research being conducted by Dr. Miles Efron of 
the Graduate School of Library and Information Science at the University of Illinois. By participating 
in this study, you are helping improve techniques for searching for information in large 
collections of digitized texts.</p>

<p>This study will take approximately 30 minutes. You will be asked to conduct a series of searches in
a collection of over 2 million books using an experimental search engine. For each search, you will be 
asked a series of questions about your searches and results returned by the system. All search terms, result 
ratings and question responses will be recorded. All data will be stored on a private, secure server hosted
by the University of Illinois.</p>

<p> Your name or  identifying information will not be associated with your responses in reporting or dissemination 
of this research. Contact information and identifiable responses will only be accessible to project personnel, and will 
be stored on a private, secure server hosted by the University of Illinois.</p>

<p>You are free to discontinue participation in the study at any time by selecting the "Quit the study" button.</p>

<p>The results of this study will be delivered in reports reports and for possible dissimination as part of
journal articles, academic papers, and/or conference papers or posters.</p> 

<h3>Time commitment</h3>
<p>This study will last no longer than 30 minutes.</p>

<h3>Benefits of participation</h3>
<p>Your participation will help to advance research and tools for in information retrieval and book search.</p>

<h3>Risks of participation</h3>
<p>Your participation in this research project is entirely voluntary, with no risks besides those of 
everyday life.  Your participation, or your decision not to participate, will not affect your grades at, 
status at, or future relations with the University of Illinois at Urbana-Champaign or any of the investigators.</p>

<h3>Confidentiality</h3>
<p>All data will be stored securely. Optional demographic information will be for internal use only, 
to balance the representativeness of our sample and will not be disseminated.</p>

<h3>Consent to participate in the study</h3>
<p>
Clicking the submit button below and completing the searches, you indicates your consent to participate and 
your consent to the following summary points:
<ul>
<li>I am 18 years of age or older.</li>
<li>I can discontinue participation at any time, and do not have to answer any questions I do not wish to answer.</li>
<li>My identity will be kept confidential.</li>
<li>My interactions with the system will be recorded.</li>
</ul>
</p>

<p>You may print a copy of this form for your records</p>

If you have questions, please contact Craig Willis (email: willis8@illinois.edu) or Miles Efron (mefron@illinois.edu, 217-265-0825).</p>
<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.submit.label', default: 'Submit')}" />

					

 
			
		</g:form>
	</body>
</html>
