"
XDP generalization relationship
"
Class {
	#name : 'XPDGeneralization',
	#superclass : 'XPDRelationship',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'visiting' }
XPDGeneralization >> visit: aVisitor with: argument [

	aVisitor visitXDPGeneralization: self with: argument
]
