"
This class represents a new form components. It represents a button and a form.

"
Class {
	#name : #NewTaskComponent,
	#superclass : #WAComponent,
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
NewTaskComponent class >> form [	
	| maForm |
	maForm := Task new asComponent.
	
	maForm addDecoration: TBSMagritteFormDecoration newWithDefaultButtons.
	maForm magritteDescription tbsInlineValidationMessages: true.
	maForm magritteDescription tbsFormInline: true.
	^ maForm 
]

{ #category : #'instance creation' }
NewTaskComponent >> open [
	(self call: self class form)
		ifNotNil: [ :task | 
			(task
				creator: self session currentUser;
				assignee: (User selectOne: [ :u | u username = task assignee ]))
				save.
			self session announcer announce: Reload ]
]

{ #category : #rendering }
NewTaskComponent >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self open ];
		with: 'Create'.
	
]
