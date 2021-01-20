"
Plan model class.

icebergIntegration: boolean
name: string
usersCount: integer

"
Class {
	#name : #Plan,
	#superclass : #Object,
	#instVars : [
		'name',
		'usersCount',
		'icebergIntegration'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #initialization }
Plan class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
Plan class >> name: aString usersCount: anInteger [ 
	^ self new name: aString; 
				  usersCount: anInteger.
]

{ #category : #accessing }
Plan >> icebergIntegration [
	^ icebergIntegration
]

{ #category : #accessing }
Plan >> icebergIntegration: aTrue [ 
	icebergIntegration := aTrue
]

{ #category : #accessing }
Plan >> name [
	^ name
]

{ #category : #accessing }
Plan >> name: aString [ 
	name := aString
]

{ #category : #accessing }
Plan >> usersCount [
	^ usersCount
]

{ #category : #accessing }
Plan >> usersCount: anInteger [ 
	usersCount := anInteger
]
