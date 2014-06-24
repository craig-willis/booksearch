// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
		grails.solr.url = "http://localhost:8984"
    }
    production {
        grails.logging.jul.usebridge = false
		grails.solr.url = "http://compute-0-0:8984"
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
//grails.plugins.springsecurity.userLookup.userDomainClassName = 'edu.illinois.lis.User'
//grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'edu.illinois.lis.UserRole'
//grails.plugins.springsecurity.authority.className = 'edu.illinois.lis.Role'

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'edu.illinois.lis.Person'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'edu.illinois.lis.PersonAuthority'
grails.plugins.springsecurity.authority.className = 'edu.illinois.lis.Authority'
grails.plugins.springsecurity.requestMap.className = 'edu.illinois.lis.Requestmap'
grails.plugins.springsecurity.securityConfigType = 'Requestmap'
grails.plugins.springsecurity.ui.encodePassword = true

grails {
	mail {
		host = "smtp.gmail.com"
		port = 465
		username = "cawillis@gmail.com"
		password = "m3t4m4g1c"
		props = ["mail.smtp.auth":"true",
				 "mail.smtp.socketFactory.port":"465",
				 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
				 "mail.smtp.socketFactory.fallback":"false"]
	}
}

grails.views.javascript.library="jquery"

grails.plugin.springsecurity.rejectIfNoRule = true
grails.plugin.springsecurity.fii.rejectPublicInvocations = false

grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugin.springsecurity.interceptUrlMap = [
	'/':                  ['permitAll'],
	'/index':             ['permitAll'],
	'/index.gsp':         ['permitAll'],
	'/**/js/**':          ['permitAll'],
	'/**/css/**':         ['permitAll'],
	'/**/images/**':      ['permitAll'],
	'/**/favicon.ico':    ['permitAll'],
	'/login/**':          ['permitAll'],
	'/logout/**':         ['permitAll'],
	'/admin/**':          ['ROLE_ADMIN'],
	'/study/**':          ['ROLE_ADMIN'],
	'/user/**':           ['ROLE_ADMIN'],
	'/person/**':         ['ROLE_ADMIN'],
	'/session/**':        ['ROLE_ADMIN'],
	'/consent/**':        ['ROLE_USER'],
	'/demoProfile/**':    ['ROLE_USER'],
	'/personStudy/**':    ['ROLE_USER'],
	'/personSession/**':  ['ROLE_USER'],
	'/search/**':         ['ROLE_USER'],

 ]


security {
	ui {
		register {
			emailBody = '''\
Hello,<br/>
<br/>
You (or someone pretending to be you) created an account with this email address.<br/>
<br/>
If you made the request, please click&nbsp;<a href="$url">here</a> to finish the registration.
'''
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'Book search study account'
			defaultRoleNames = ['ROLE_USER']
			postRegisterUrl = null // use defaultTargetUrl if not set
		}

		forgotPassword {
			emailBody = '''\
Hello,<br/>
<br/>
You (or someone pretending to be you) requested that your password be reset.<br/>
<br/>
If you didn't make this request then ignore the email; no changes have been made.<br/>
<br/>
If you did make the request, then click <a href="$url">here</a> to reset your password.
'''
			emailFrom = 'do.not.reply@localhost'
			emailSubject = 'Password Reset'
			postResetUrl = null // use defaultTargetUrl if not set
		}
	}
}


