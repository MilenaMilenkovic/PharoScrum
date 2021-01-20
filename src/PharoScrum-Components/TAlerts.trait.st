"
Trait used by screens where we want to show the error message at the top of the screen.

errorMsg:	 string
"
Trait {
	#name : #TAlerts,
	#instVars : [
		'errorMsg'
	],
	#category : #'PharoScrum-Components'
}

{ #category : #accessing }
TAlerts >> errorMsg [
	^ errorMsg
]

{ #category : #accessing }
TAlerts >> errorMsg: msg [
	errorMsg := msg
]

{ #category : #accessing }
TAlerts >> renderAlertOn: html [
	html tbsColumn 
		mediumSize: 10;
		mediumOffset: 1;
		with: [ 
			self renderErrorMessageIfAnyOn: html ]
]

{ #category : #accessing }
TAlerts >> renderErrorMessageIfAnyOn: html [
	self errorMsg
		ifNotNil: [ :msg |
			html tbsAlert
				beDanger;
				with: [ 
					html anchor 
						class: 'close';
						attributeAt: 'data-dismiss' put: 'alert';
						with: [ html html: '&#215;' ].
					html div: msg ] ]

]
