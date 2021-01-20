"
Task model class.

username:	 string
encriptedPassword:	 string
email:	 string
role: Role instance
tasks:	 the collection of Task instances
	
API:

User find:         - Returns the user with passed username
User qa            - Returns qa users
User authenticate: - Authenticates the user (Trait)

"
Class {
	#name : #User,
	#superclass : #Object,
	#traits : 'TAuthentication',
	#classTraits : 'TAuthentication classTrait',
	#instVars : [
		'email',
		'tasks',
		'role'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #scopes }
User class >> find: aUsername [
	^ self selectOne: [ :user | user username = aUsername ]
]

{ #category : #initialization }
User class >> isVoyageRoot [  
	^ true
]

{ #category : #scopes }
User class >> qa [
	^ self selectMany: [ :user |  user role = QARole instance ]
]

{ #category : #initialization }
User class >> username: aString [ 
	^ self new username: aString.
]

{ #category : #testing }
User >> canAdd [
	"TODO: Create some kind of delegation system"
	^ self role canAdd
]

{ #category : #testing }
User >> canClose [
	"TODO: Create some kind of delegation system"
	^ self role canClose
]

{ #category : #testing }
User >> canDelete [
	"TODO: Create some kind of delegation system"
	^ self role canDelete
]

{ #category : #testing }
User >> canEdit [
	"TODO: Create some kind of delegation system"
	^ self role canEdit
]

{ #category : #testing }
User >> canReopen [
	"TODO: Create some kind of delegation system"
	^ self role canReopen
]

{ #category : #accessing }
User >> email [
	^ email
]

{ #category : #accessing }
User >> email: anEmail [
	email := anEmail
]

{ #category : #accessing }
User >> role [
	^ role
]

{ #category : #accessing }
User >> role: aRole [ 
	role := aRole
]

{ #category : #accessing }
User >> tasks [
	^ Task selectMany: [ :task | 
		(task assignee ifNotNil: [ :a | a username = self username ]) = true or:
		(task creator username = self username) ]
]
