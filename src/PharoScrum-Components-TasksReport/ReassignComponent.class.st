"
Modal component class.

task: Task instance (which supposed to be updated - reassigned).

API:

reassign: - Reassignes a task and answers with true.
"
Class {
	#name : #ReassignComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
ReassignComponent class >> task: aTask [
	^ self new 
		task: aTask; 
		yourself
]

{ #category : #'as yet unclassified' }
ReassignComponent >> assignees [
	^ (AssigneesComponent selected: self task assignee username) 
		onAnswer: [ :assignee | self reassign: assignee ]
]

{ #category : #'as yet unclassified' }
ReassignComponent >> reassign: assignee [
	(User find: assignee) ifNotNil: [ :user | self task assignee: user ]. 
		self answer: true
]

{ #category : #rendering }
ReassignComponent >> renderContentOn: html [
	html tbsModal
		id: 'reassignDialog';
		with: [
			html tbsModalDialog: [
				html tbsModalContent: [
					html tbsModalHeader: 'Reassign to QA:'.
					html tbsModalBody: [ html render: self assignees ] ] ] ]
]

{ #category : #accessing }
ReassignComponent >> task [
	^ task
]

{ #category : #accessing }
ReassignComponent >> task: aTask [
	task := aTask
]
