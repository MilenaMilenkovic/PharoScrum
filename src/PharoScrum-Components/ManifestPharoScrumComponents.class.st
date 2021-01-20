"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoScrumComponents,
	#superclass : #PackageManifest,
	#category : #'PharoScrum-Components-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoScrumComponents class >> ruleAsClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AuthentificationComponent #validate #false)) #'2021-01-16T00:55:42.728805+01:00') #(#(#RGMethodDefinition #(#AuthentificationComponent #authenticated #false)) #'2021-01-16T01:36:47.775623+01:00') )
]
