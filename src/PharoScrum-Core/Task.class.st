"
Task model class.

nextId (class instance variable): integer  Just to show the way how it works in Pharo :)

assignee:	 User instance
creator:	User instance
description:	 text
points: integer
scope:	 string
status: string
title:	 string
	
API:

Task status - returns permitted values for a status
"
Class {
	#name : #Task,
	#superclass : #Object,
	#instVars : [
		'id',
		'status',
		'scope',
		'points',
		'title',
		'description',
		'creator',
		'assignee'
	],
	#classInstVars : [
		'nextId'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #initialization }
Task class >> creator: aUser [ 
	^ self new creator: aUser.
]

{ #category : #initialization }
Task class >> isVoyageRoot [  
	^ true
]

{ #category : #accessing }
Task class >> resetSequence [
	nextId := 0
]

{ #category : #accessing }
Task class >> scope [
	^ #UNDEFINED.
]

{ #category : #accessing }
Task class >> status [
	^ #(#analyze #open #inProgress #inQa #done #reopened)
]

{ #category : #accessing }
Task >> assignee [
	^ assignee
]

{ #category : #accessing }
Task >> assignee: aUser [ 
	assignee := aUser.
]

{ #category : #accessing }
Task >> commits [
	^ PSCommit select: self scope, '-', self id greaseString
]

{ #category : #accessing }
Task >> creator [
	^ creator
]

{ #category : #accessing }
Task >> creator: aUser [ 
	creator := aUser.
]

{ #category : #accessing }
Task >> description [
	^ description
]

{ #category : #accessing }
Task >> description: aString [ 
	description := aString
]

{ #category : #'magritte descriptions' }
Task >> descriptionAssignee [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #assignee;
		beRequired;
		priority: 600;
		options: (User selectAll collect: [ :user | user username ]);
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: NewTaskFormRenderer;
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionDescription [
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #description;
		beRequired;
		priority: 300;
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionPoints [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #points;
		beRequired;
		priority: 500;
		options: #(1 2 3 5 8 13);
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionScope [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #scope;
		beRequired;
		default: #DEMO;
		options: #(#DEMO #RESEARCH);
		priority: 100;
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionStatus [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #status;
		beRequired;
		priority: 400;
		default: #analyze;
		options: self class status;		
		yourself
]

{ #category : #'magritte descriptions' }
Task >> descriptionTitle [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #title;
		beRequired;
		priority: 200;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #accessing }
Task >> id [
	^ id
]

{ #category : #accessing }
Task >> points [
	^ points
]

{ #category : #accessing }
Task >> points: anInteger [ 
	points := anInteger.
]

{ #category : #actions }
Task >> save [
	id := Task allSubclasses 
				detect: [ :c | c scope = self scope ] 
					ifFound: [ :c | c count ]  
					ifNone:  [ nil ].
	super save.
]

{ #category : #accessing }
Task >> scope [
	^ scope
]

{ #category : #accessing }
Task >> scope: aString [ 
	scope := aString.
]

{ #category : #accessing }
Task >> status [
	^ status
]

{ #category : #accessing }
Task >> status: aStatus [
	status := aStatus.
]

{ #category : #accessing }
Task >> title [
	^ title
]

{ #category : #accessing }
Task >> title: aString [ 
	title := aString.
]
