Class {
	#name : #PlanTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'plan'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
PlanTest >> setUp [
	"Define a subject"
	super setUp.
	plan := Plan new.

]

{ #category : #tests }
PlanTest >> testIcebergIntegration [

	self assert: (plan icebergIntegration: true) icebergIntegration.
	
]

{ #category : #tests }
PlanTest >> testName [
	| planName |
	
	planName := 'Demo'.
	self assert: (plan name: planName) name equals: planName.
	
	
]

{ #category : #tests }
PlanTest >> testUsersCount [
	| usersCount |
	
	usersCount := 10.
	self assert: (plan usersCount: usersCount) usersCount equals: usersCount.
	
]
