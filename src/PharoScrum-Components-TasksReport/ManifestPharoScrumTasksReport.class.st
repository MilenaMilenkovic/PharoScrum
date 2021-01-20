"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoScrumTasksReport,
	#superclass : #PackageManifest,
	#category : #'PharoScrum-Components-TasksReport-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoScrumTasksReport class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#EditTaskStatusComponent #children #false)) #'2021-01-12T00:04:40.836733+01:00') )
]

{ #category : #'code-critics' }
ManifestPharoScrumTasksReport class >> ruleWAUnnecessaryBlockPassedToBrushRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#StatusTileComponent #renderContentOn: #false)) #'2021-01-16T13:57:18.866555+01:00') )
]
