Class {
	#name : #TaskTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
TaskTest >> setUp [
	"Define a subject"
	super setUp.
	task := Task new.
	Task removeAll.

]

{ #category : #tests }
TaskTest >> testAssignee [ 
	| user |
	
	user := User username: 'test' password: 'pass-test-1'.
	self assert: (task assignee: user) assignee username equals: 'test'.
	
]

{ #category : #tests }
TaskTest >> testDescription [ 
	| description |
	
	description := 'Create generator class which can be used for automated Pharo class creation 
	              	 with accessing methods and specs'.
	self assert: (task description: description) description equals: description.
	
]

{ #category : #tests }
TaskTest >> testInitializerWithACreator [
	| creator |
	
	creator := User username: 'test' password: 'pass-test-1'.
	self assert: (Task creator: creator) creator username equals: 'test'.
	
]

{ #category : #tests }
TaskTest >> testPoints [
	| points |
	
	points := 3.
	self assert: (task points: points) points equals: points.
	
]

{ #category : #tests }
TaskTest >> testScope [
	| scope |
	
	scope := #DEMO.
	self assert: (task scope: scope) scope equals: scope.
	
]

{ #category : #tests }
TaskTest >> testTitle [
	| title |
	
	title := 'Pharo class generator'.
	self assert: (task title: title) title equals: title.
	
]
