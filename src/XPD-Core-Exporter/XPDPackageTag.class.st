"
A package tag
"
Class {
	#name : #XPDPackageTag,
	#superclass : #XPDXDPObject,
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #defaults }
XPDPackageTag >> stereotypeName [

	^'packagetag'
]

{ #category : #visiting }
XPDPackageTag >> visit: aVisitor with: argument [

	aVisitor visitXDPPackageTag: self with: argument
]
