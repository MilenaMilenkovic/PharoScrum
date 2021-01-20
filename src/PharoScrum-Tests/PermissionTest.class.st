Class {
	#name : #PermissionTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'permission'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
PermissionTest >> setUp [
	"Define a subject"
	super setUp.
	permission := Permission new.

]

{ #category : #tests }
PermissionTest >> testName [
	| name |
	
	name := #edit.
	self assert: (permission name: name) name equals: name.
]
