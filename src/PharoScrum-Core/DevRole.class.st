"
Has unique instance which represents developer role in the app.
"
Class {
	#name : #DevRole,
	#superclass : #Role,
	#traits : 'TRoleSingleton',
	#classTraits : 'TRoleSingleton classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #accessing }
DevRole class >> permissions [
	^ #(#add #edit)
]

{ #category : #testing }
DevRole >> canAdd [
	^ true
]

{ #category : #testing }
DevRole >> canEdit [
	^ true
]
