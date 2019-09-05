"
General XDP object
"
Class {
	#name : #XDPObject,
	#superclass : #XDPElement,
	#instVars : [
		'source',
		'ownedElements'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #testing }
XDPObject class >> isAbstract [ 

	^self name = #XDPObject
]

{ #category : #'instance creation' }
XDPObject class >> source: anObject [

	^(self new)
		source: anObject;
		yourself
]

{ #category : #accessing }
XDPObject >> addOwnedElement: anObject [

	^self ownedElements add: anObject 
]

{ #category : #initialization }
XDPObject >> initialize [
	super initialize.
	ownedElements := OrderedCollection new.
]

{ #category : #accessing }
XDPObject >> name [

	^source name
]

{ #category : #accessing }
XDPObject >> ownedElements [
	^ ownedElements
]

{ #category : #accessing }
XDPObject >> ownedElements: anObject [
	ownedElements := anObject
]

{ #category : #accessing }
XDPObject >> source [
	^ source
]

{ #category : #accessing }
XDPObject >> source: anObject [
	source := anObject
]

{ #category : #defaults }
XDPObject >> stereotypeName [

	^self subclassResponsibility 
]

{ #category : #defaults }
XDPObject >> stereotypeProfile [

	^'pharo'
]
