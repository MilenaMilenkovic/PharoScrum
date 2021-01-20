Class {
	#name : #QARoleTest,
	#superclass : #PharoScrumTest,
	#category : #'PharoScrum-Tests'
}

{ #category : #tests }
QARoleTest >> testCanAdd [

	self assert: QARole instance canAdd.
]

{ #category : #tests }
QARoleTest >> testCanClose [

	self assert: QARole instance canClose.
]

{ #category : #tests }
QARoleTest >> testCanDelete [

	self deny: QARole instance canDelete.
]

{ #category : #tests }
QARoleTest >> testCanEdit [

	self deny: QARole instance canEdit.
]

{ #category : #tests }
QARoleTest >> testCanReopen [

	self assert: QARole instance canReopen.
]
