"
Edit task button.

children: the collection of WAComponent instances (the button & the optional (ReassignComponent) modal)
label:	 string
status: string (the status used for a task update)
task:	Task instance (the task to be updated)
	
API:

edit: - updates the status and fires an announcement
EditTaskStatusBtnComponent labels - returns a Dictionary with the current status as a key, action label to switch to the next status as a value
"
Class {
	#name : #EditTaskStatusBtnComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task',
		'status',
		'label',
		'children'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
EditTaskStatusBtnComponent class >> labels [
	"Current status as a key, action label to switch to the next status as a value"
	^ Dictionary newFrom: { 
		nil -> 'Analyze' .
		#analyze -> 'Ready' . 
		#open -> 'Start' . 
		#inProgress -> 'Finish' . 
		#inQa -> 'Done' . 
		#done -> 'Reopen' .
		#reopened -> 'Analyze'
	}
]

{ #category : #accessing }
EditTaskStatusBtnComponent class >> task: aTask status: aStatus [
	^ self new 
		task: aTask;
		status: aStatus
]

{ #category : #accessing }
EditTaskStatusBtnComponent class >> task: aTask status: aStatus label: aLabel [
	^ (self task: aTask status: aStatus)
		label: aLabel
]

{ #category : #callbacks }
EditTaskStatusBtnComponent >> edit: aStatus [
	self task 
		status: aStatus; 
		save.
	self session announcer announce: Reload
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> enabled [
	^ (self task status = #inQa and: self session currentUser canClose) or: 
	  (task status ~= #inQa and: self session currentUser canEdit)
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> label [
	^ label ifNil: [ label := (self class labels at: self task status) ].
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> label: aLabel [
	label := aLabel
]

{ #category : #'html utilities' }
EditTaskStatusBtnComponent >> reassignment [
	^ (ReassignComponent task: self task) 
		onAnswer: [ :continue | continue ifTrue: [ self edit: #inQa ] ]
]

{ #category : #rendering }
EditTaskStatusBtnComponent >> renderBtnOn: html [
	html tbsSubmitButton  
		beDisabledIf: [ self enabled not ];
		callback: [ self edit: self status ];
		with: self label
]

{ #category : #rendering }
EditTaskStatusBtnComponent >> renderContentOn: html [
	self status = #inQa 
		ifTrue: [ self renderFinishBtnOn: html ]
		ifFalse: [ self renderBtnOn: html ]
]

{ #category : #rendering }
EditTaskStatusBtnComponent >> renderFinishBtnOn: html [
	"Render button with a modal"
	html render: self reassignment.
	html tbsNavbarButton
		attributeAt: 'data-target' put: '#reassignDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: 'Finish'
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> status [
	^ status
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> status: aStatus [
	status := aStatus
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> task [
	^ task
]

{ #category : #accessing }
EditTaskStatusBtnComponent >> task: aTask [
	task := aTask
]
