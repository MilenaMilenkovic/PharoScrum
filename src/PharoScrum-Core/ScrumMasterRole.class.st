"
Has unique instance which represents scrum master role in the app.
"
Class {
	#name : #ScrumMasterRole,
	#superclass : #Role,
	#traits : 'TRoleSingleton',
	#classTraits : 'TRoleSingleton classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #initialization }
ScrumMasterRole class >> permissions [
	^ #(#add #edit #reopen #delete)
]

{ #category : #testing }
ScrumMasterRole >> canAdd [
	^ true
]

{ #category : #testing }
ScrumMasterRole >> canClose [
	^ true
]

{ #category : #testing }
ScrumMasterRole >> canDelete [
	^ true
]

{ #category : #testing }
ScrumMasterRole >> canEdit [
	^ true
]

{ #category : #testing }
ScrumMasterRole >> canReopen [
	^ true
]
