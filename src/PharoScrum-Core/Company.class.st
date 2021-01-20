"
Company model class

name: string
plan: Plan object
status: string
"
Class {
	#name : #Company,
	#superclass : #Object,
	#instVars : [
		'name',
		'status',
		'plan'
	],
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #testing }
Company class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
Company class >> plan: aPlan [ 
	^ self new plan: aPlan.
]

{ #category : #'magritte descriptions' }
Company >> descriptionName [
	^ MAStringDescription new
		accessor: #name;
		beRequired;
		yourself
]

{ #category : #'magritte descriptions' }
Company >> descriptionPlan [
	^ MAStringDescription new
		accessor: #plan;
		beRequired;
		yourself
]

{ #category : #'magritte descriptions' }
Company >> descriptionStatus [
	^ MAStringDescription new
		accessor: #status;
		beRequired;
		yourself
]

{ #category : #accessing }
Company >> name [
	^ name
]

{ #category : #accessing }
Company >> name: aName [ 
	name := aName.
]

{ #category : #accessing }
Company >> plan [
	^ plan
]

{ #category : #accessing }
Company >> plan: aPlan [ 
	plan := aPlan.
]

{ #category : #accessing }
Company >> status [
	^ status
]

{ #category : #accessing }
Company >> status: aStatus [ 
	status := aStatus.
]
