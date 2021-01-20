"
This class renders a default button passing to it the next status of a task, and an optional button (Reopen) if the next status is In QA.

task:	Task instance
	
API:

nextStatus - The next status of the task
"
Class {
	#name : #EditTaskStatusComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
EditTaskStatusComponent class >> task: aTask [	
	^ self new task: aTask
]

{ #category : #accessing }
EditTaskStatusComponent >> nextStatus [
	^ (Task status readStream) skipTo: self task status; 
		next
]

{ #category : #rendering }
EditTaskStatusComponent >> renderContentOn: html [
	html tbsForm: [ 
		html render: (EditTaskStatusBtnComponent
							task: self task
							status: (self nextStatus ifNil: [ #analyze ])).
			 
		self task status = #inQa
			ifTrue: [ html space. html render: (ReopenTaskBtnComponent task: self task) ] ]
]

{ #category : #accessing }
EditTaskStatusComponent >> task [
	^ task
]

{ #category : #accessing }
EditTaskStatusComponent >> task: aTask [
	task := aTask
]
