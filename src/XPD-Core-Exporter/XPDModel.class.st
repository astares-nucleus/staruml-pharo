"
XDP model stereotype
"
Class {
	#name : 'XPDModel',
	#superclass : 'XPDXDPObject',
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'accessing' }
XPDModel >> name [

	^'Pharo'
]

{ #category : 'defaults' }
XPDModel >> stereotypeName [

	^'model'
]

{ #category : 'visiting' }
XPDModel >> visit: aVisitor [

	^aVisitor visitXDPModel: self
]
