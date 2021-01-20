"
To have the demo data stored, run the command DemoSeed run from a playground.
"
Class {
	#name : #DemoSeed,
	#superclass : #Object,
	#category : #'PharoScrum-Core-PharoScrum-Core'
}

{ #category : #running }
DemoSeed class >> cleanup [
	Admin removeAll.
	User removeAll.
	Task removeAll.
	DemoTask resetSequence.
	ResearchTask resetSequence.
				
	
	
	
]

{ #category : #'as yet unclassified' }
DemoSeed class >> devTickets [
	^ #(
		'Integrate iceberg' 
		'Add missing model specs'
		'Implement delegation mechanism'
		'Cleanup TODOs'
	)
]

{ #category : #'as yet unclassified' }
DemoSeed class >> qaTickets [
	^ #(
		'Add createdAt attribute to the Task data model' 
		'Add prompt modal for moving into In QA'
		'Add "Under construction image in the admin"'
	)
]

{ #category : #'as yet unclassified' }
DemoSeed class >> researchTickets [
	^ #('Find out what is the best way to include CSS code into the Pharo')
]

{ #category : #running }
DemoSeed class >> run [
	| developer qa scrumMaster |
	
	self cleanup.
	
	(Admin username: 'admin' password: 'admin') save.
						
	developer := (User username: 'dev' password: 'dev') 
						role: DevRole instance; 
						save.
									
	qa := (User username: 'test' password: 'test') 
				role: QARole instance; 
				save.
				
	scrumMaster := (User username: 'sm' password: 'sm') 
							role: ScrumMasterRole instance;
							save.
							
	self researchTickets do: [ :title |
		(ResearchTask creator: developer) 
			assignee: developer;
			status: #open;
			points: 3;
			title: title;
			description: 'Some task explanation and acceptance criteria and etc.';
			save ].
	
	self devTickets do: [ :title |
		(DemoTask creator: scrumMaster) 
			assignee: developer;
			status: #inProgress;
			points: 2;
			title: title;
			description: 'Some task explanation and acceptance criteria and etc.';
			save ].
		
	self qaTickets do: [ :title |
		(DemoTask creator: scrumMaster) 
			assignee: qa;
			status: #inQa;
			points: 3;
			title: title;
			description: 'Some task explanation and acceptance criteria and etc.';
			save ].
				
	
	
	
]
