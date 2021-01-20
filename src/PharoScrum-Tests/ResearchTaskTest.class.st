Class {
	#name : #ResearchTaskTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
ResearchTaskTest >> setUp [
	"Define a subject"
	super setUp.
	task := ResearchTask new.
	Task removeAll.

]

{ #category : #tests }
ResearchTaskTest >> testCount [

	ResearchTask new save.
	Task new save.

	self assert: ResearchTask count equals: 2
]

{ #category : #tests }
ResearchTaskTest >> testInitialize [

	self assert: task scope equals: #RESEARCH.
]
