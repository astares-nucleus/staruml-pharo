"
A package tag
"
Class {
	#name : 'XPDPackageTag',
	#superclass : 'XPDXDPObject',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'defaults' }
XPDPackageTag >> stereotypeName [

	^'tag'
]

{ #category : 'visiting' }
XPDPackageTag >> visit: aVisitor with: argument [

	aVisitor visitXDPPackageTag: self with: argument
]
