"
Role model class.

permissions: the collection of Permission instancess.a
"
Class {
	#name : #Role,
	#superclass : #Object,
	#instVars : [
		'permissions'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #testing }
Role class >> isVoyageRoot [ 
	^ true
]

{ #category : #initialization }
Role class >> with: aCollection [ 
	^ (self new)
		permissions: aCollection;
		yourself
]

{ #category : #accessing }
Role >> permissions [
	^ permissions
]

{ #category : #accessing }
Role >> permissions: aCollection [ 
	permissions := aCollection
]
