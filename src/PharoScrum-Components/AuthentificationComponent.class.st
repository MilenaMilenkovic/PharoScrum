"
Login component for a User and an Admin.

Use the message Admin resource: ResourceClass to initialize the Login component for a specific class (User/Admin)

Responsible for authentication (showing the login component and validating credentials on the callback).
"
Class {
	#name : #AuthentificationComponent,
	#superclass : #WAComponent,
	#traits : 'TAlerts',
	#classTraits : 'TAlerts classTrait',
	#instVars : [
		'login',
		'password',
		'component',
		'resource'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #initialization }
AuthentificationComponent class >> resource: aClass [
	^ self new
		resource: aClass;
		yourself
]

{ #category : #accessing }
AuthentificationComponent >> authenticated [
	^ (self resource greaseString, 'Component') asClass new.
]

{ #category : #accessing }
AuthentificationComponent >> login [
	^ login
]

{ #category : #accessing }
AuthentificationComponent >> login: aString [
	login := aString 
]

{ #category : #accessing }
AuthentificationComponent >> password [
	^ password
]

{ #category : #accessing }
AuthentificationComponent >> password: aString [
	password := aString 
]

{ #category : #rendering }
AuthentificationComponent >> renderContentOn: html [

	html tbsRow showGrid;
		with: [ self renderAlertOn: html.
				  self renderFormOn: html ].
					
	super renderContentOn: html
]

{ #category : #rendering }
AuthentificationComponent >> renderFormOn: html [

	html tbsColumn 
		mediumSize: 4;
		mediumOffset: 4;
		with: [
			html tbsForm: [
				self renderLoginFieldOn: html.
				self renderPasswordFieldOn: html.
				self renderLoginButtonOn: html ] ]
]

{ #category : #rendering }
AuthentificationComponent >> renderLoginButtonOn: html [
	html tbsSubmitButton
		bePrimary;
		callback: [ self validate ];
		value: 'Login'
		
]

{ #category : #rendering }
AuthentificationComponent >> renderLoginFieldOn: html [
	html
		tbsFormGroup: [ 
			html label: 'Login'.
			html textInput tbsFormControl;
				attributeAt: 'autofocus' put: 'true';
				placeholder: 'Email/Username';
				callback: [ :value | login := value ];
				value: login ]
		
]

{ #category : #rendering }
AuthentificationComponent >> renderPasswordFieldOn: html [
	html
		tbsFormGroup: [ 
			html label: 'Password'.
			html passwordInput tbsFormControl;
				attributeAt: 'autofocus' put: 'true';
				placeholder: 'Password';
				callback: [ :value | password := value ];
				value: password ]
		
]

{ #category : #accessing }
AuthentificationComponent >> resource [
	^ resource
]

{ #category : #accessing }
AuthentificationComponent >> resource: aClass [
	resource := aClass
]

{ #category : #rendering }
AuthentificationComponent >> style [
	^ PSFileLibrary new authenticationCss
]

{ #category : #accessing }
AuthentificationComponent >> validate [
	| r |
	r := self resource username: self login password: self password.
	
	(self resource authenticate: r)
		ifNil: [ 
			self errorMsg: 'Invalid login or password'.
			^ false ]
		ifNotNil: [ :dbRecord | 
			self session currentUser: dbRecord.
			self call: self authenticated. 
			^ true ]

]
