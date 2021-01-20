"
This class decouples tasks into groups by status and renders by StatusTileComponents.

API:

StatusTilesComponent decoupled: - decouples tasks into groups and for each group initializes the component 
"
Class {
	#name : #StatusTilesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'children'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #'as yet unclassified' }
StatusTilesComponent class >> decoupled: tasks [
	"decouples tasks into groups and for each group initializes the component"
	^ Task status collect: [ :status |
		| label |
		label := (self labels at: status).
		
		(tasks select: [ :task | task status = status ]) 
			ifEmpty: [ StatusTileComponent label: label ]
			ifNotEmpty: [ :group | (StatusTileComponent label: label tasks: group) ] ]
]

{ #category : #accessing }
StatusTilesComponent class >> labels [
	^ Dictionary newFrom: { 
		#analyze -> 'Under analysis' .
		#open -> 'Open' . 
		#inProgress -> 'In Progress' . 
		#inQa -> 'In QA' . 
		#done -> 'Done' . 
		#reopened -> 'Reopened'
	}
]

{ #category : #accessing }
StatusTilesComponent class >> tasks: rows [	
	^ self new
		children: (self decoupled: rows);
		yourself 
]

{ #category : #rendering }
StatusTilesComponent >> children [
	^ children
]

{ #category : #rendering }
StatusTilesComponent >> children: components [
	children := components 
]

{ #category : #rendering }
StatusTilesComponent >> renderContentOn: html [
	(html tbsRow: [ html render: self children ])
		class: 'tiles';
		showGrid
]
