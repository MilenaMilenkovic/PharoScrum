"
Header component supposed to be shown on the each screen.

component: WAComponent instance (Screen instance on which the header is visible)
"
Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #'instance creation' }
HeaderComponent class >> from: aComponent [
	"TODO: Move into Trait"
	^ self new
		component: aComponent;
		yourself.
]

{ #category : #accessing }
HeaderComponent >> component [
	^ component
]

{ #category : #accessing }
HeaderComponent >> component: aComponent [
	component := aComponent
]

{ #category : #rendering }
HeaderComponent >> renderAuthenticableButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
HeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [
		html tbsNavbarBrand
			url: self application url;
			with: 'PharoScrum' 
	]
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			self renderBrandOn: html.
			self session active ifTrue: [ self renderAuthenticableButtonsOn: html ]
		]
	]
]

{ #category : #rendering }
HeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
		tbsPullRight;
			callback: [ 
				self session reset.
				self call: AuthentificationComponent new ];
			with: [
				html text: 'Disconnect '.
				html tbsGlyphIcon iconLogout ]
]
