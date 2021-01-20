"
GithubCommit mapper class.

anchor: mapped html_url
author: mapped author, login
message:	mapped commit, message
"
Class {
	#name : #CommitMapper,
	#superclass : #Object,
	#instVars : [
		'message',
		'author',
		'anchor'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #'instance creation' }
CommitMapper class >> from: githubCommit [
	^ self new
		message: ((githubCommit  at: 'commit') at: 'message');
		author: ((githubCommit at: 'author') at: 'login');
		anchor: (githubCommit at: 'html_url');
		yourself
]

{ #category : #accessing }
CommitMapper >> anchor [
	^ anchor
]

{ #category : #accessing }
CommitMapper >> anchor: anObject [
	anchor := anObject
]

{ #category : #accessing }
CommitMapper >> author [
	^ author
]

{ #category : #accessing }
CommitMapper >> author: anObject [
	author := anObject
]

{ #category : #accessing }
CommitMapper >> message [
	^ message
]

{ #category : #accessing }
CommitMapper >> message: anObject [
	message := anObject
]
