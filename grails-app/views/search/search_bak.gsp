<head>
<meta name='layout' content='main' />
<title><g:message code="search.title" /></title>
<style type='text/css' media='screen'>
#search {
	margin:15px 0px; padding:0px;
	text-align:center;
}
#search .cssform p {
	clear: left;
	margin: 0;
	padding: 5px 0 8px 0;
	padding-left: 105px;
	margin-bottom: 10px;
	height: 1%;
}
#search .cssform input[type='text'] {
	width: 220px;
}
#search .cssform label {
	font-weight: bold;
	float: left;
	margin-left: -105px;
	width: 100px;
}
#login .inner .text_ {width:120px;}
</style>

</head>

<body>
	<div id='search'>
		<form action='${postUrl}' method='POST' id='searchForm' class='cssform' autocomplete='off'>
			<p>
				<input type='text' class='text_' name='q' id='query' />
			</p>
			<p>
				<input type='submit' value='${message(code: "search.button")}' />
			</p>
		</form>
	</div>

<script type='text/javascript'>
<!--
(function(){
	document.forms['searchForm'].elements['q'].focus();
})();
// -->
</script>
</body>
