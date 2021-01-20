"
This class is responsible for #DEMO (scope) task creation.
"
Class {
	#name : #DemoTask,
	#superclass : #Task,
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #accessing }
DemoTask class >> count [
	^ (Task count: [ :t | t scope = #DEMO ]) + 1
]

{ #category : #accessing }
DemoTask class >> scope [
	^ #DEMO.
]

{ #category : #initialization }
DemoTask >> initialize [
	scope := #DEMO.
	super initialize
]
