Class {
	#name : #DevRoleTest,
	#superclass : #PharoScrumTest,
	#category : #'PharoScrum-Tests'
}

{ #category : #test }
DevRoleTest >> testCanAdd [

	self assert: DevRole instance canAdd.
]

{ #category : #tests }
DevRoleTest >> testCanClose [

	self deny: DevRole instance canClose.
]

{ #category : #tests }
DevRoleTest >> testCanDelete [

	self deny: DevRole instance canDelete.
]

{ #category : #test }
DevRoleTest >> testCanEdit [

	self assert: DevRole instance canEdit.
]

{ #category : #tests }
DevRoleTest >> testCanReopen [

	self deny: DevRole instance canReopen.
]
