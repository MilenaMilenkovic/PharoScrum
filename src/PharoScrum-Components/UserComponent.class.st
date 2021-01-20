"
Screen class used for User pages.
"
Class {
	#name : #UserComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #hooks }
UserComponent >> children [
	^ super children copyWith: self report
]

{ #category : #initialization }
UserComponent >> initialize [
	super initialize.
	self report: (TasksReport load: self session currentUser).
]

{ #category : #rendering }
UserComponent >> renderContentOn: html [
	super renderContentOn: html.
		html tbsContainer: [ 
			html space.
			html render: self report ]
]

{ #category : #accessing }
UserComponent >> report [
	^ report
]

{ #category : #accessing }
UserComponent >> report: aReport [
	report := aReport
]
