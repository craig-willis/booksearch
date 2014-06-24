package edu.illinois.lis

import study.*
class Person {

	transient springSecurityService

	String username
	String password
	String email
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String toString() {
		return username
	}

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}
	
	Set<PersonStudy> getStudies() {
		PersonStudy.findAllByPerson(this).collect { it } as Set
	}

	def beforeInsert() {
		//encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			//encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
