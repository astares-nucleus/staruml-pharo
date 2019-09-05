"
An XDP Element
"
Class {
	#name : #XPDElement,
	#superclass : #Object,
	#instVars : [
		'guid'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #accessing }
XPDElement >> guid [
	^ guid
]

{ #category : #accessing }
XPDElement >> guid: anObject [
	guid := anObject
]
