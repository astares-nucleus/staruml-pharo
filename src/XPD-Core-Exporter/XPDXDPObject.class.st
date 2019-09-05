"
General XDP object
"
Class {
	#name : #XPDXDPObject,
	#superclass : #XPDElement,
	#instVars : [
		'source',
		'ownedElements'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #testing }
XPDXDPObject class >> isAbstract [ 

	^self name = #XPDXDPObject
]

{ #category : #'instance creation' }
XPDXDPObject class >> source: anObject [

	^(self new)
		source: anObject;
		yourself
]

{ #category : #accessing }
XPDXDPObject >> addOwnedElement: anObject [

	^self ownedElements add: anObject 
]

{ #category : #initialization }
XPDXDPObject >> initialize [
	super initialize.
	ownedElements := OrderedCollection new.
]

{ #category : #accessing }
XPDXDPObject >> name [

	^source name
]

{ #category : #accessing }
XPDXDPObject >> ownedElements [
	^ ownedElements
]

{ #category : #accessing }
XPDXDPObject >> ownedElements: anObject [
	ownedElements := anObject
]

{ #category : #accessing }
XPDXDPObject >> source [
	^ source
]

{ #category : #accessing }
XPDXDPObject >> source: anObject [
	source := anObject
]

{ #category : #defaults }
XPDXDPObject >> stereotypeName [

	^self subclassResponsibility 
]

{ #category : #defaults }
XPDXDPObject >> stereotypeProfile [

	^'pharo'
]
