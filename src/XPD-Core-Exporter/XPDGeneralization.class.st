"
XDP generalization relationship
"
Class {
	#name : #XPDGeneralization,
	#superclass : #XPDRelationship,
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #'instance creation' }
XPDGeneralization class >> from: aClass to: aSuperclass [

	^(self new)
		from: aClass;
		to: aSuperclass;
		yourself
]

{ #category : #visiting }
XPDGeneralization >> visit: aVisitor with: argument [

	aVisitor visitXDPGeneralization: self with: argument
]
