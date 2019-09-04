"
General XDP object
"
Class {
	#name : #XDPObject,
	#superclass : #XDPElement,
	#instVars : [
		'name'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #testing }
XDPObject class >> isAbstract [ 

	^self name = #XDPObject
]

{ #category : #accessing }
XDPObject >> name [
	^ name
]

{ #category : #accessing }
XDPObject >> name: anObject [
	name := anObject
]

{ #category : #defaults }
XDPObject >> stereotypeName [

	^self subclassResponsibility 
]

{ #category : #defaults }
XDPObject >> stereotypeProfile [

	^'pharo'
]
