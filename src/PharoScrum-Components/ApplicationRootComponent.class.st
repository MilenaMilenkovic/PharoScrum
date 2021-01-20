"
Application root component & a root filter class.

main: WAComponent instance (currently visible component)
"
Class {
	#name : #ApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #'class initialization' }
ApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'as yet unclassified' }
ApplicationRootComponent class >> includeLibraries: app [
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
]

{ #category : #'class initialization' }
ApplicationRootComponent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'PharoScrum'.
	
	"Initialize session"
	app preferenceAt: #sessionClass put: Session.
		
	"Libraries used by the app are included here"
	self includeLibraries: app.
]

{ #category : #hooks }
ApplicationRootComponent >> children [
	^ Array with: self main
]

{ #category : #hooks }
ApplicationRootComponent >> initialRequest: aRequest [
	| consumer pageName |
	
	super initialRequest: aRequest.
	
	consumer := self requestContext consumer.
	
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase.
	
	"non authenticated routes"

	pageName = 'admin' ifTrue: [ self main: (AuthentificationComponent resource: Admin) ].
	pageName = 'login' ifTrue: [ self main: (AuthentificationComponent resource: User) ].
		
   consumer next
]

{ #category : #accessing }
ApplicationRootComponent >> main [
	^ main ifNil: [ main := AuthentificationComponent resource: User ]
]

{ #category : #accessing }
ApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
ApplicationRootComponent >> renderContentOn: html [
	html render: self children
]
