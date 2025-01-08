"
XDP package stereotype
"
Class {
	#name : 'XPDPackage',
	#superclass : 'XPDXDPObject',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'defaults' }
XPDPackage >> stereotypeName [

	^'package'
]

{ #category : 'visiting' }
XPDPackage >> visit: aVisitor with: argument [

	aVisitor visitXDPPackage: self with: argument
]
