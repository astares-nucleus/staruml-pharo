"
XDP realization relationship
"
Class {
	#name : #XPDRealization,
	#superclass : #XPDRelationship,
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #visiting }
XPDRealization >> visit: aVisitor with: argument [

	aVisitor visitXDPRealization: self with: argument
]
