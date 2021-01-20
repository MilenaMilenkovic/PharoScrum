Class {
	#name : #RoleTest,
	#superclass : #PharoScrumTest,
	#instVars : [
		'role'
	],
	#category : #'PharoScrum-Tests'
}

{ #category : #running }
RoleTest >> setUp [
	"Define a subject"
	super setUp.
	role := Role new.

]

{ #category : #tests }
RoleTest >> testInitializerWithPermissions [
	| permissions |

	permissions := { Permission name: #add . Permission name: #reopen }.
	self assert: (Role with: permissions) permissions size equals: 2.

]

{ #category : #tests }
RoleTest >> testPermissions [
	| permission |
	
	permission := Permission name: #test.
	
	self assert: (role permissions: (OrderedCollection with: permission)) permissions size equals: 1.
]
