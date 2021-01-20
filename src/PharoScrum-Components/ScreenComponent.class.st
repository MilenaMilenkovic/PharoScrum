"
Parent class of application screen components.

header: WAComponent instance
"
Class {
	#name : #ScreenComponent,
	#superclass : #ApplicationRootComponent,
	#instVars : [
		'header'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #hooks }
ScreenComponent >> children [
	^ Array with: header
]

{ #category : #initialization }
ScreenComponent >> createHeaderComponent [
	^ HeaderComponent from: self.
]

{ #category : #initialization }
ScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent.
]

{ #category : #rendering }
ScreenComponent >> renderContentOn: html [
	html render: header
]
