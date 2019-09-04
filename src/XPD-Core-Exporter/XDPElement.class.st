"
An XDP Element
"
Class {
	#name : #XDPElement,
	#superclass : #Object,
	#instVars : [
		'guid'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #accessing }
XDPElement >> guid [
	^ guid
]

{ #category : #accessing }
XDPElement >> guid: anObject [
	guid := anObject
]
