"
Reopen task btn component visible only for tasks which are In QA. 
And enabled for a click only for QA users.
"
Class {
	#name : #ReopenTaskBtnComponent,
	#superclass : #EditTaskStatusBtnComponent,
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
ReopenTaskBtnComponent class >> task: aTask [
	^ self 
		task: aTask
		status: #reopened
		label: 'Reopen'
]

{ #category : #accessing }
ReopenTaskBtnComponent >> enabled [
	^ self session currentUser canReopen.
]

{ #category : #rendering }
ReopenTaskBtnComponent >> renderContentOn: html [
	 self renderBtnOn: html
]
