"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoScrumTests,
	#superclass : #PackageManifest,
	#category : #'PharoScrum-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoScrumTests class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#RoleTest #testInitializerWithPermissions #false)) #'2021-01-10T21:29:10.632635+01:00') )
]
