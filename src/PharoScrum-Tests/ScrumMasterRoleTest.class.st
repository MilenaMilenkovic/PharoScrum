Class {
	#name : #ScrumMasterRoleTest,
	#superclass : #PharoScrumTest,
	#category : #'PharoScrum-Tests'
}

{ #category : #test }
ScrumMasterRoleTest >> testCanAdd [

	self assert: ScrumMasterRole instance canAdd
]

{ #category : #test }
ScrumMasterRoleTest >> testCanClose [

	self assert: ScrumMasterRole instance canClose
]

{ #category : #test }
ScrumMasterRoleTest >> testCanDelete [

	self assert: ScrumMasterRole instance canDelete
]

{ #category : #test }
ScrumMasterRoleTest >> testCanEdit [

	self assert: ScrumMasterRole instance canEdit
]

{ #category : #test }
ScrumMasterRoleTest >> testCanReopen [

	self assert: ScrumMasterRole instance canReopen
]
