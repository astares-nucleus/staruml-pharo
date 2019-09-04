"
General XDP object
"
Class {
	#name : #XDPObject,
	#superclass : #Object,
	#instVars : [
		'guid'
	],
	#category : #'XPD-Pharo-Exporter-Model'
}

{ #category : #testing }
XDPObject class >> isAbstract [ 

	^self name = #XDPObject
]

{ #category : #defaults }
XDPObject >> stereotypeName [

	^self subclassResponsibility 
]

{ #category : #defaults }
XDPObject >> stereotypeProfile [

	^'pharo'
]
