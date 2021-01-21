"
Permission model class.

name: a symbol.
"
Class {
	#name : #Permission,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #testing }
Permission class >> isVoyageRoot [ 
	^ true
]

{ #category : #initialization }
Permission class >> name: aString [ 
	^ self new name: aString
]

{ #category : #accessing }
Permission >> name [
	^ name
]

{ #category : #accessing }
Permission >> name: aSymbol [
	name := aSymbol
]
