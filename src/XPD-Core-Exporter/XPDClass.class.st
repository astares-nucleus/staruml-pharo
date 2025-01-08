"
XDP class stereotype
"
Class {
	#name : 'XPDClass',
	#superclass : 'XPDXDPObject',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'defaults' }
XPDClass >> stereotypeName [

	^'class'
]

{ #category : 'visiting' }
XPDClass >> visit: aVisitor with: argument [

	aVisitor visitXDPClass: self with: argument
]
