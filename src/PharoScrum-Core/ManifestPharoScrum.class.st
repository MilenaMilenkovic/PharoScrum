"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoScrum,
	#superclass : #PackageManifest,
	#category : #'PharoScrum-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoScrum class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Role class' #dev #true)) #'2021-01-10T22:04:44.858487+01:00') #(#(#RGMethodDefinition #(#'Role class' #qa #true)) #'2021-01-10T22:05:13.429592+01:00') #(#(#RGMethodDefinition #(#'ScrumMasterRole class' #current #true)) #'2021-01-11T00:13:29.930479+01:00') )
]

{ #category : #'code-critics' }
ManifestPharoScrum class >> ruleRBRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Task class' #count #true)) #'2021-01-16T20:01:56.892953+01:00') )
]

{ #category : #'code-critics' }
ManifestPharoScrum class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Task #commits #false)) #'2021-01-16T16:44:36.711757+01:00') )
]
