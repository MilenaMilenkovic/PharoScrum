"
The Component which represent a column on the screen of tasks with the same status.

children:	 a collection of TaskTileComponent instances
label:	 the status 
"
Class {
	#name : #StatusTileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'children',
		'label'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
StatusTileComponent class >> label: aLabel [	
	^ self new 
		label: aLabel;
		children: OrderedCollection new
]

{ #category : #accessing }
StatusTileComponent class >> label: aLabel tasks: tasks [ 
	^ (self label: aLabel)
		children: (TaskTileComponent collection: tasks)
]

{ #category : #hooks }
StatusTileComponent >> children [
	^ children
]

{ #category : #accessing }
StatusTileComponent >> children: taskTiles [
	children := taskTiles

]

{ #category : #rendering }
StatusTileComponent >> label [
	^ label.

]

{ #category : #rendering }
StatusTileComponent >> label: aLabel [
	label := aLabel

]

{ #category : #rendering }
StatusTileComponent >> renderContentOn: html [
	html tbsColumn
		smallSize: 6;
		mediumSize: 4;
		class: 'status-tiles';
		with: [ 
			html heading level: 5; with: [ html strong: self label ].
			html div
				class: 'group';
				with: [ html render: children ] ]
]
