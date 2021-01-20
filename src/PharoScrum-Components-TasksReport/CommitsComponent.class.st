"
The task github commits class.

task: Task instance
"
Class {
	#name : #CommitsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'task'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #'instance creation' }
CommitsComponent class >> for: aTask [
	^ self new
		task: aTask
]

{ #category : #rendering }
CommitsComponent >> renderCommitsOn: html [
	html div
		class: 'commits';
		with: [ 
			self task commits
				ifNotEmpty: [ :commits | 
					commits do: [ :commit | 
						html render: (CommitComponent commit: commit) ] ]
				ifEmpty: [ html label: 'No commits' ] ]
]

{ #category : #rendering }
CommitsComponent >> renderContentOn: html [
	html
		div
		class: 'tile';
		with: [
			html strong: 'Commits'.
			html break.
			self renderCommitsOn: html.
			html break.
			html anchor
				callback: [ self answer ];
				with: 'Back'.  ].
	html break
]

{ #category : #accessing }
CommitsComponent >> task [
	^ task
]

{ #category : #accessing }
CommitsComponent >> task: anObject [
	task := anObject
]
