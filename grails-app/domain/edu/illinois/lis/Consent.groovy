package edu.illinois.lis



// One consent record per person per study
class Consent 
{
	Person person
	Study study
	String signature;
	boolean consent1
	boolean consent2
	boolean consent3
	Date dateCreated
	
	static constraints = {
		signature blank: false
		consent1 blank: false
		consent2 blank: false
		consent3 blank: false
	}
}
