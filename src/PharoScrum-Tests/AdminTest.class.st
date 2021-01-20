Class {
	#name : #AdminTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'subject'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #tests }
AdminTest >> testAuthenticate [ 
	
	(Admin username: 'auth' password: 'auth') save.
	
	self assert: (Admin authenticate: (Admin username: 'auth' password: 'test')) isNil. 
	self deny: (Admin authenticate: (Admin username: 'auth' password: 'auth')) isNil. 
]
