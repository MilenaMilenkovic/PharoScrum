"
This class enables overrwriting the default Magrrite form rendered.
"
Class {
	#name : #NewTaskFormRenderer,
	#superclass : #TBSMagritteFormRenderer,
	#category : #'PharoScrum-Components-TasksReport'
}

{ #category : #rendering }
NewTaskFormRenderer >> renderContainer: aDescription [
	html div
		class: 'new-task tile';
		with: [ super renderContainer: aDescription ]
]

{ #category : #rendering }
NewTaskFormRenderer >> renderInlineError: aDescription [
	(self errorsForDescription: aDescription) do: [ :error |
		html div: [ html label class: 'text-danger'; with: error ] ]
]
