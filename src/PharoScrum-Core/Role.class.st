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
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #initialization }
Role class >> with: aCollection [ 
	^ self new permissions: aCollection
]

{ #category : #accessing }
Role >> permissions [
	^ permissions
]

{ #category : #accessing }
Role >> permissions: aCollection [ 
	permissions := aCollection
]
