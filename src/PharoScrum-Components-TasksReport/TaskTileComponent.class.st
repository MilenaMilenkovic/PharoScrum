"
Component class which represent a task tile on the screen

task: Task instance

API: 
	Task collection: - this message instantiates a collection of a TaskTileComponents from a collection of tasks
"
Class {
	#name : #TaskTileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
TaskTileComponent class >> collection: tasks [
	^ tasks collect: [ :task | self new task: task ]
]

{ #category : #accessing }
TaskTileComponent class >> task: aTask [
	^ self new task: aTask.
]

{ #category : #initialization }
TaskTileComponent >> assignee [
	"TODO: Create some kind of delegation system"
	^ task assignee username.
]

{ #category : #initialization }
TaskTileComponent >> creator [
	"TODO: Create some kind of delegation system"
	^ task creator username.
]

{ #category : #initialization }
TaskTileComponent >> description [
	"TODO: Create some kind of delegation system"
	^ task description.
]

{ #category : #initialization }
TaskTileComponent >> id [
	"TODO: Create some kind of delegation system"
	^ task id.
]

{ #category : #initialization }
TaskTileComponent >> initialize [
	super initialize.
	task := Task new.
]

{ #category : #initialization }
TaskTileComponent >> points [
	"TODO: Create some kind of delegation system"
	^ task points.
]

{ #category : #rendering }
TaskTileComponent >> renderContentOn: html [
	html div 
		class: 'tile';
		with: [ 
			html anchor
				callback: [ self call: (CommitsComponent for: self task) ];
				with: [  
					html label: '[ ', self scope , '-' , self id greaseString , ' ] ', self title ].
			html div
				class: 'task-users';
				with: [
					html div: [  
						html div: 'Owner '.
						html tbsLabel
							beDefault; 
							with: self creator. 
					].
					html div: [
						html div: 'Assignee '.
						html tbsLabel 
							beInfo; 
							with: self assignee ] ].
			html div
				class: 'task-description';
				with: self description.
			html div
				class: 'task-details';
				with: [ 
					html render: (EditTaskStatusComponent task: self task).
					html tbsLabel 
						class: 'task-points';
						beDefault; 
						with: self points. 
					html space ] ].
	html break
]

{ #category : #initialization }
TaskTileComponent >> scope [
	"TODO: Create some kind of delegation system"
	^ task scope.
]

{ #category : #initialization }
TaskTileComponent >> status [
	"TODO: Create some kind of delegation system"
	^ task status.
]

{ #category : #accessing }
TaskTileComponent >> task [
	^ task
]

{ #category : #accessing }
TaskTileComponent >> task: aTask [
	task := aTask
]

{ #category : #initialization }
TaskTileComponent >> title [
	"TODO: Create some kind of delegation system"
	^ task title.
]
