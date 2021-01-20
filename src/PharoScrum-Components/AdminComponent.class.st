"
Screen class used for Admin pages.
"
Class {
	#name : #AdminComponent,
	#superclass : #ScreenComponent,
	#category : #'PharoScrum-Components'
}

{ #category : #rendering }
AdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html image form: PSFileLibrary new underconstructionJpg.
]
