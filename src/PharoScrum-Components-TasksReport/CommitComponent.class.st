"
The Github Commit component class.

commit: Github commit response instance
"
Class {
	#name : #CommitComponent,
	#superclass : #WAComponent,
	#instVars : [
		'commit'
	],
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #accessing }
CommitComponent class >> commit: aCommit [
	^ self new
		commit: aCommit
]

{ #category : #accessing }
CommitComponent >> commit [
	^ commit
]

{ #category : #accessing }
CommitComponent >> commit: anObject [
	commit := anObject
]

{ #category : #rendering }
CommitComponent >> renderContentOn: html [ 
	html div: [ 
			html anchor
				url: commit anchor;
				with: commit message.
			html space.
			html span: commit author ]
]
