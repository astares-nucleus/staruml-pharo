"
XDP trait stereotype
"
Class {
	#name : 'XPDTrait',
	#superclass : 'XPDXDPObject',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'defaults' }
XPDTrait >> stereotypeName [

	^'trait'
]

{ #category : 'visiting' }
XPDTrait >> visit: aVisitor with: argument [

	aVisitor visitXDPTrait: self with: argument
]
