"
Trait used by Admin and User class for authentification.
"
Trait {
	#name : #TAuthentication,
	#instVars : [
		'username',
		'encriptedPassword'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #generation }
TAuthentication classSide >> authenticate: anObject [
	| subject query |
	
	query := [ :each | (each username compare: anObject username caseSensitive: false) = 2 ].
	
	subject := self selectOne: query.
	
	subject ifNotNil: [ :dbRecord |
		subject password = anObject password ifTrue: [ ^ dbRecord ] ] .
	
	^ nil
			
	
	
]

{ #category : #initialization }
TAuthentication classSide >> username: aString password: aString2 [ 
	^ self new username: aString;
			     password: aString2.
]

{ #category : #accessing }
TAuthentication >> password [
	^ encriptedPassword
]

{ #category : #accessing }
TAuthentication >> password: aString [ 
	encriptedPassword := SHA256 hashMessage: aString.
]

{ #category : #accessing }
TAuthentication >> username [
	^ username
]

{ #category : #accessing }
TAuthentication >> username: aString [ 
	username := aString
]
