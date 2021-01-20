"
A CommitMapperTest is a test class for testing the behavior of CommitMapper
"
Class {
	#name : #CommitMapperTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'commit'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
CommitMapperTest >> setUp [
	"Define a subject"
	super setUp.
	commit := CommitMapper from: (Dictionary newFrom: { 
		'html_url' -> 'https://github.com/MilenaMilenkovic/PharoScrum/commit/123'.
		'commit' -> (Dictionary newFrom: { 'message' -> 'Initial commit' }) .
		'author' -> (Dictionary newFrom: { 'login' -> 'MilenaMilenkovic' })
	})

]

{ #category : #test }
CommitMapperTest >> testAnchor [

	self assert: commit anchor equals: 'https://github.com/MilenaMilenkovic/PharoScrum/commit/123'.
]

{ #category : #test }
CommitMapperTest >> testAuthor [

		self assert: commit author equals: 'MilenaMilenkovic'.
]

{ #category : #test }
CommitMapperTest >> testMessage [

		self assert: commit message equals: 'Initial commit'.
]
