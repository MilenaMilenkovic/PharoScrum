"
Session class.

announcer: WAComponent instance (announcer component)
currentUser:	 User/Admin instance
"
Class {
	#name : #Session,
	#superclass : #WASession,
	#instVars : [
		'currentUser',
		'announcer'
	],
	#category : #'PharoScrum-Utils'
}

{ #category : #accessing }
Session >> active [
	^ currentUser isNotNil
]

{ #category : #accessing }
Session >> announcer [
    ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
Session >> currentUser [
	^ currentUser
]

{ #category : #accessing }
Session >> currentUser: anObject [
	currentUser := anObject
]

{ #category : #initialization }
Session >> reset [
	currentUser := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
