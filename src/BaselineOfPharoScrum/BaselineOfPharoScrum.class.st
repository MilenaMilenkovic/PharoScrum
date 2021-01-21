"
Baseline of a PharoScrum
"
Class {
	#name : #BaselineOfPharoScrum,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoScrum
}

{ #category : #baselines }
BaselineOfPharoScrum >> baseline: spec [
	<baseline>
	spec for: #common do: [
		self seaside: spec.	
		self voyage: spec.
		self bootstrap: spec.
		self tbsmagritte: spec.
		
      spec
            package: 'PharoScrum-Core' 
					with: [ spec requires: 
					#('Voyage' 'BootstrapMagritte' 'PharoScrum-Ice' 'PharoScrum-Components-TasksReport') ];
				
				package: 'PharoScrum-Tests' 
					with: [ spec requires: #('Voyage' 'PharoScrum-Core') ];
				package: 'PharoScrum-Components' 
					with: [ spec requires: #('Seaside3' 'Bootstrap' 'PharoScrum-Components-TasksReport' 'PharoScrum-Assets' 'PharoScrum-Utils') ];
				package: 'PharoScrum-Components-TasksReport' 
					with: [ spec requires: #('Seaside3' 'Bootstrap' 'BootstrapMagritte' 'PharoScrum-Utils') ];
				package: 'PharoScrum-Assets' 
					with: [ spec requires: #('Seaside3') ];
				package: 'PharoScrum-Ice';
				package: 'PharoScrum-Utils' 
					with: [ spec requires: #('Seaside3') ] ]
]

{ #category : #dependencies }
BaselineOfPharoScrum >> bootstrap: spec [
	spec 
   		baseline: 'Bootstrap'
      with: [ spec repository: 'github://astares/Seaside-Bootstrap:master/src' ]
]

{ #category : #accessing }
BaselineOfPharoScrum >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfPharoScrum >> seaside: spec [
	spec 
   		baseline: 'Seaside3'
      with: [ 
			spec
				loads: #(Core);
				repository: 'github://SeasideSt/Seaside/repository' ].
]

{ #category : #dependencies }
BaselineOfPharoScrum >> tbsmagritte: spec [
	spec project: 'BootstrapMagritte' with: [
		spec
			className: 'ConfigurationOfBootstrapMagritte';
			repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/' ]
]

{ #category : #dependencies }
BaselineOfPharoScrum >> voyage: spec [
	spec
		baseline: 'Voyage'
		with: [ 
			spec 
				loads: #(core memory);
				repository: 'github://pharo-nosql/voyage/mc' ]

]
