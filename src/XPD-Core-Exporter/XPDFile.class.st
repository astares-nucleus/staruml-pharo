"
An XPD file

See http://www.cs.sjsu.edu/faculty/pearce/modules/projects/oop/codeGen/codeGen.htm
"
Class {
	#name : #XPDFile,
	#superclass : #Object,
	#instVars : [
		'stream',
		'builder'
	],
	#category : #'XPD-Core-Exporter-Base'
}

{ #category : #'private - writing basic' }
XPDFile >> closeTag: aTag indent: times [

	times timesRepeat: [ stream tab ].
	stream 
		nextPutAll: '</';
		nextPutAll: aTag;
		nextPut: $>.
	self newLine	
]

{ #category : #'private - writing basic' }
XPDFile >> indent: times [

	times timesRepeat: [ stream tab ]
]

{ #category : #initialization }
XPDFile >> initialize [ 
	super initialize.
	stream := String new writeStream.
	builder := XPDModelBuilder new build.
]

{ #category : #'private - writing basic' }
XPDFile >> newLine [
	stream crlf 
]

{ #category : #'private - writing basic' }
XPDFile >> openTag: aTag indent: times [

	self indent: times.
	stream 
		nextPut: $<;
		nextPutAll: aTag;
		nextPut: $>.
	self newLine
]

{ #category : #'private - writing basic' }
XPDFile >> raw: aString [

	stream nextPutAll: aString
]

{ #category : #'private - accessing' }
XPDFile >> stream [
	^ stream
]

{ #category : #'private - accessing' }
XPDFile >> stream: anObject [
	stream := anObject
]

{ #category : #visiting }
XPDFile >> visitXDPModel: aModel [
	self indent: 2.
	self 
		raw: '<XPD:OBJ name="DocumentElement" type="UMLModel" guid="';
		raw: aModel guid asString;
		raw: '">';
		newLine;
		indent: 3;
		raw: '<XPD:ATTR name="Name" type="string">';
		raw: aModel name;
		raw: '</XPD:ATTR>';
		newLine; 
		indent: 3;
		raw: '<XPD:ATTR name="StereotypeProfile" type="string">pharo</XPD:ATTR>';
		newLine;
		indent: 3;
		raw: '<XPD:ATTR name="StereotypeName" type="string">model</XPD:ATTR>'.
	
	aModel ownedElements ifNotEmpty: [ 
		
		self
			newLine; 
			indent: 3; 
			raw: '<XPD:ATTR name="#OwnedElements" type="integer">';
			raw: 	aModel ownedElements size asString; 
			raw: '</XPD:ATTR>'	
	].
		
	self 
		newLine;
		indent: 2;
		raw: '</XPD:OBJ>'
	
		
]

{ #category : #writing }
XPDFile >> write [ 
	self writeIntro.
	self writeModel.
	self writeOutro.
		
	^stream contents
]

{ #category : #'private - writing' }
XPDFile >> writeIntro [
	self 
		writeXMLHeader;
		raw: '<XPD:UNIT xmlns:XPD="http://www.staruml.com" version="1">';
		newLine;
		writeXPDHeader
]

{ #category : #'private - writing' }
XPDFile >> writeModel [
	self openTag: 'XPD:BODY' indent: 1.
	builder model visit: self.
	self closeTag: 'XPD:BODY' indent: 1.

]

{ #category : #'private - writing' }
XPDFile >> writeOutro [ 

	self 
		newLine;
		closeTag: 'XPD:UNIT' indent: 0
]

{ #category : #'private - writing' }
XPDFile >> writeXMLHeader [

	self 
		raw: '<?xml version="1.0" encoding="UTF-8"?>';
		newLine 
]

{ #category : #'private - writing' }
XPDFile >> writeXPDHeader [

	self 
		openTag: 'XPD:HEADER' indent: 1;
		openTag: 'XPD:SUBUNITS' indent: 2;
		closeTag: 'XPD:SUBUNITS' indent: 2;
		closeTag: 'XPD:HEADER' indent: 1
	
]
