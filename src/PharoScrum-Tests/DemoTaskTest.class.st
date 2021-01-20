Class {
	#name : #DemoTaskTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
DemoTaskTest >> setUp [
	"Define a subject"
	super setUp.
	task := DemoTask new.
	Task removeAll.

]

{ #category : #tests }
DemoTaskTest >> testCount [

	ResearchTask new save.
	Task new save.

	self assert: DemoTask count equals: 1
]

{ #category : #tests }
DemoTaskTest >> testInitialize [

	self assert: task scope equals: #DEMO.
]
