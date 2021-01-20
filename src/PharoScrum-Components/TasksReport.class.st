"
Task Magritte Report class.
Has overriden default Magritte report renderContentOn.

children:	 the collection of WAComponent instances (NewTaskComponent & StatusTilesComponent)
"
Class {
	#name : #TasksReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'children'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #loading }
TasksReport class >> load: aUser [
	^ self rows: aUser tasks description: aUser tasks anyOne magritteDescription
]

{ #category : #hooks }
TasksReport >> children [
	^ children ifNil: [ 
		children := Array 
							with: (self session currentUser canAdd ifTrue: [ NewTaskComponent new ])
							with: self statusTiles. ]
]

{ #category : #initialization }
TasksReport >> initialize [
    super initialize.
    self session announcer when: Reload do: [ :x | self reload ] 
]

{ #category : #actions }
TasksReport >> reload [
	self children at: 2 put: self statusTiles.
]

{ #category : #rendering }
TasksReport >> renderContentOn: html [
	html tbsContainer: [ html render: children ]
]

{ #category : #'html utilities' }
TasksReport >> statusTiles [
	^ StatusTilesComponent tasks: self session currentUser tasks
]

{ #category : #hooks }
TasksReport >> style [
	^ PSFileLibrary new tasksCss
]
