"
This class is responsible for fetching the GitHub commits.

API:

PSCommit select: - returns the list of parsed task commits
"
Class {
	#name : #PSCommit,
	#superclass : #Object,
	#category : #'PharoScrum-Ice'
}

{ #category : #'as yet unclassified' }
PSCommit class >> repo [
	^ 'repos/MilenaMilenkovic/PharoScrum'
]

{ #category : #actions }
PSCommit class >> select: taskId [
	"This methods shows just an example of using the power of Pharo world availability"
	"This is not a good way of reading the GitHub history associated to the task"
	| response |
	
	response := IceGitHubAPI new getRaw: self repo , '/commits'.

	^ ((STON fromString: response contents) 
			select: [ :c |  ((c at: 'commit') at: 'message') matchesRegex: taskId, '.*' ])
			collect: [ :c | CommitMapper from: c ]
]
