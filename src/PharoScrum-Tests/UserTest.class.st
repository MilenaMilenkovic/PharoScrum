Class {
	#name : #UserTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'user'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
UserTest >> setUp [
	"Define a subject"
	super setUp.
	user := User username: 'test'.
	User removeAll.

]

{ #category : #tests }
UserTest >> testAuthenticate [ 
	
	(User username: 'auth' password: 'auth') save.
	
	self assert: (User authenticate: (User username: 'auth' password: 'test')) isNil. 
	self deny: (User authenticate: (User username: 'auth' password: 'auth')) isNil. 
]

{ #category : #tests }
UserTest >> testEmail [
	| email |
	
	email := 'test@test.com'.
	self assert: (user email: email) email equals: email.
]

{ #category : #tests }
UserTest >> testFind [
	| username |
	
	username := 'find'.
	
	self assert: (User find: username) isNil. 
	
	(User username: username) save.
	
	self assert: (User find: username) username equals: username. 
]

{ #category : #tests }
UserTest >> testQa [
	
	self assert: User qa size equals: 0. 
	
	(User username: 'qa')
		role: QARole instance;
		save.
	
	self assert: User qa size equals: 1. 
]

{ #category : #tests }
UserTest >> testRole [
	| role |
	
	role := Role with: { Permission name: #reopen }.
	self assert: (user role: role) role permissions size equals: 1.
]

{ #category : #tests }
UserTest >> testTasks [
	| otherUser |
	otherUser := User username: 'test 2'.
	
	(Task new) title: 'Test 1'; creator: user; save.
	(Task new) title: 'Test 2'; creator: otherUser; assignee: user; save. 
	(Task new) title: 'Test 3'; creator: otherUser; save. 
	
	self assert: user tasks size equals: 2.
	self deny: (user tasks detect: [ :a | a title = 'Test 1' ]) isNil.
	self deny: (user tasks detect: [ :a | a title = 'Test 2' ]) isNil.
	
	self should: [ user tasks detect: [ :a | a title = 'Test 3' ] ] raise: NotFound.
]
