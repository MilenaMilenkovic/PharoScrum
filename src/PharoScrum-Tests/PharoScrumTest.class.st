"
Parent class if test cases, responsible for a database swutching.
"
Class {
	#name : #PharoScrumTest,
	#superclass : #TestCase,
	#instVars : [
		'previousRepository'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
PharoScrumTest >> setUp [
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.

]

{ #category : #running }
PharoScrumTest >> tearDown [
	VORepository setRepository: previousRepository
]
