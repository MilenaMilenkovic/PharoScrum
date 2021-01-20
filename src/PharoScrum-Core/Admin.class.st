"
Admin user model class.

encriptedPassword: string
username:	 string
"
Class {
	#name : #Admin,
	#superclass : #Object,
	#traits : 'TAuthentication',
	#classTraits : 'TAuthentication classTrait',
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #testing }
Admin class >> isVoyageRoot [
	^ true
]
