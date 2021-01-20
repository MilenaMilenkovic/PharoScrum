Class {
	#name : #CompanyTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'company'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
CompanyTest >> setUp [
	"Define a subject"
	super setUp.
	company := Company new.

]

{ #category : #tests }
CompanyTest >> testInitializerWithAPlan [
	| plan |
	
	plan := Plan name: 'Demo' usersCount: 10.
	self assert: (Company plan: plan) plan name equals: 'Demo'.
	
]

{ #category : #tests }
CompanyTest >> testName [
	| companyName |
	
	companyName := 'Test'.
	self assert: (company name: companyName) name equals: companyName.
	
]

{ #category : #tests }
CompanyTest >> testPlan [
	| plan |
	
	plan := Plan name: 'Demo' usersCount: 10.
	self assert: (company plan: plan) plan name equals: 'Demo'.
	
]

{ #category : #tests }
CompanyTest >> testStatus [
	| companyStatus |
	
	companyStatus := 1.
	self assert: (company status: companyStatus) status equals: companyStatus.
	
]
