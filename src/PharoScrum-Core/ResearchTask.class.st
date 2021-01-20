"
This class is responsible for #RESEARCH (scope) task creation.
"
Class {
	#name : #ResearchTask,
	#superclass : #Task,
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #accessing }
ResearchTask class >> count [
	^ (Task count: [ :t | t scope = #RESEARCH ]) + 1
]

{ #category : #accessing }
ResearchTask class >> scope [
	^ #RESEARCH.
]

{ #category : #initialization }
ResearchTask >> initialize [
	scope := #RESEARCH.
	super initialize
]
