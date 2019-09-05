"
General XDP object
"
Class {
	#name : #XDPObject,
	#superclass : #XDPElement,
	#instVars : [
		'source'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #testing }
XDPObject class >> isAbstract [ 

	^self name = #XDPObject
]

{ #category : #accessing }
XDPObject >> name [

	^source name
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
