<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.login.title" /></title>
<g:javascript library="jquery" plugin="jquery"/>
<style type='text/css' media='screen'>
#login {
	margin:15px 0px; padding:0px;
	text-align:center;
	font-size: smaller;
}
#login .inner {
	width:260px;
	margin:0px auto;
	text-align:left;
	padding:10px;
	background-color:#EEF;
}
#login .inner .fheader {
	padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px; font-weight: bold;
}
#login .inner .cssform p {
	clear: left;
	margin-left: 10px;
	padding: 5px 0 8px 0;
	padding-left: 105px;
	height: 1%;
}
#login .inner .cssform input[type='text'] {
	width: 120px;
}
#login .inner .cssform label {
	float: left;
	margin-left: -105px;
	width: 100px;
}
#login .inner .login_message {color:red;}
#login .inner .text_ {width:120px;}
#login .inner .chk {height:12px;}
</style>
</head>

<body>
	<div id='login'>
		<div class='inner'>
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
			</g:if>
			<div class='fheader'><g:message code="springSecurity.login.header" /></div>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<p>
					<label for='username'><g:message code="springSecurity.login.username.label" /></label>
					<input type='text' class='text_' name='j_username' id='username' />
				</p>
				<p>
					<label for='password'><g:message code="springSecurity.login.password.label" /></label>
					<input type='password' class='text_' name='j_password' id='password' />
					<g:link controller="register" action="forgotPassword">Forgot your password?</g:link>
				</p>
				<p>
					<label for='remember_me'><g:message code="springSecurity.login.remember.me.label" /></label>
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
					<g:if test='${hasCookie}'>checked='checked'</g:if> />
				</p>
				<p>
					<input type='submit' value='${message(code: "springSecurity.login.button")}' />
				</p>
			</form>
			
		</div>
					<g:link controller="register" action="index">Create an account</g:link>
					
		
	</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
