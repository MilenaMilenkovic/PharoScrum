"
Trait used by DevRole, QARole and a ScrumMasterRole.
"
Trait {
	#name : #TRoleSingleton,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #initialization }
TRoleSingleton classSide >> initialize [
	self reset
]

{ #category : #accessing }
TRoleSingleton classSide >> instance [
	^ uniqueInstance ifNil: [ uniqueInstance := self with: 
			(self permissions collect: [ :p | Permission name: p ]) ].
]

{ #category : #accessing }
TRoleSingleton classSide >> permissions [
	self subclassResponsibility
]

{ #category : #initialization }
TRoleSingleton classSide >> reset [
	uniqueInstance := nil
]

{ #category : #testing }
TRoleSingleton >> canAdd [
	^ false
]

{ #category : #testing }
TRoleSingleton >> canClose [
	^ false
]

{ #category : #testing }
TRoleSingleton >> canDelete [
	^ false
]

{ #category : #testing }
TRoleSingleton >> canEdit [
	^ false
]

{ #category : #testing }
TRoleSingleton >> canReopen [
	^ false
]
