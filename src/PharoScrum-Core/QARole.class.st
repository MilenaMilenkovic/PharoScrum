"
Has unique instance which represents quality assurance role in the app.
"
Class {
	#name : #QARole,
	#superclass : #Role,
	#traits : 'TRoleSingleton',
	#classTraits : 'TRoleSingleton classTrait',
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #accessing }
QARole class >> permissions [
	^ #(#add #reopen)
]

{ #category : #testing }
QARole >> canAdd [
	^ true
]

{ #category : #testing }
QARole >> canClose [
	^ true
]

{ #category : #testing }
QARole >> canReopen [
	^ true
]
