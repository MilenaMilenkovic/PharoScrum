"
Assignees drop-down component.

selected: User instance 

API:

reassign - Answers to the parent component with the new assignee username
"
Class {
	#name : #AssigneesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'selected'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
AssigneesComponent class >> selected: aSelected [
	^ self new
		selected: aSelected;
		yourself
]

{ #category : #answering }
AssigneesComponent >> reassign [
	self answer: self selected
	
]

{ #category : #rendering }
AssigneesComponent >> renderContentOn: html [
	html tbsForm: [
		html tbsFormGroup: [
			html select
				list: (OrderedCollection 
							with: self selected
							with: (User qa collect: [ :user | user username ]));
				"asArray WTF?"
				callback: [ :selection  | self selected: selection asArray first ] ].

		html tbsSubmitButton
			bePrimary;
			value: 'Continue';
			callback: [ self reassign ].
		html space.
		html tbsButton
			beDefault;
			attributeAt: 'type' put: 'button';
			attributeAt: 'data-dismiss' put: 'modal';
			value: 'Cancel' ]
]

{ #category : #accessing }
AssigneesComponent >> selected [
	^ selected 
]

{ #category : #accessing }
AssigneesComponent >> selected: aSelected [
	selected := aSelected
]
