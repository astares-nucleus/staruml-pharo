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
	
]

{ #category : #'private - writing basic' }
XPDFile >> closeTag: aTag indent: times newLine: aBoolean [

	aBoolean ifTrue: [ self newLine ].	
	times timesRepeat: [ stream tab ].
	stream 
		nextPutAll: '</';
		nextPutAll: aTag;
		nextPut: $>.
	
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
	self newLine.
	self indent: times.
	stream 
		nextPut: $<;
		nextPutAll: aTag;
		nextPut: $>.
	
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
XPDFile >> visitXDPClass: anXDPClass with: anIndex [
	self
		newLine;
		indent: 5; 
		raw: '<XPD:OBJ name="OwnedElements[';
		raw: anIndex asString;
		raw: ']" type="UMLClass" guid="';
		raw: anXDPClass guid;
		raw: '">'.
		
	self 
		newLine;
		indent: 6;
		raw: '<XPD:ATTR name="Name" type="string">';
		raw: anXDPClass name;
		raw: '</XPD:ATTR>';
		newLine;
		indent: 6;		
		raw: '<XPD:ATTR name="StereotypeProfile" type="string">pharo</XPD:ATTR>';
		newLine;
		indent: 6;
		raw: '<XPD:ATTR name="StereotypeName" type="string">class</XPD:ATTR>';
		newLine;
		indent: 6;
		raw: '<XPD:REF name="Namespace">';
		raw: anXDPClass parent guid;
		raw: '</XPD:REF>'.	
		
	"self writeOwnedElementsOf: anXDPClass indent: 6."
		
	self 
		closeTag: 'XPD:OBJ' indent: 5 newLine: true
]

{ #category : #visiting }
XPDFile >> visitXDPGeneralization: aGeneralization with: anIndex [

	self writeXDPRelationship: aGeneralization stereotype: 'UMLGeneralization' with: anIndex
]

{ #category : #visiting }
XPDFile >> visitXDPModel: aModel [
	
	self
		newLine;
		indent: 2; 
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
	
	self writeOwnedElementsOf: aModel indent: 3.
		
	self 
		closeTag: 'XPD:OBJ' indent: 2	newLine: true
		
]

{ #category : #visiting }
XPDFile >> visitXDPPackage: anXDPPackage with: anIndex [
	self
		newLine;
		indent: 3; 
		raw: '<XPD:OBJ name="OwnedElements[';
		raw: anIndex asString;
		raw: ']" type="UMLPackage" guid="';
		raw: anXDPPackage guid;
		raw: '">';
		newLine.
		
	self 
		indent: 4;
		raw: '<XPD:ATTR name="Name" type="string">';
		raw: anXDPPackage name;
		raw: '</XPD:ATTR>';
		newLine;
		indent: 4;		
		raw: '<XPD:ATTR name="StereotypeProfile" type="string">pharo</XPD:ATTR>';
		newLine;
		indent: 4;
		raw: '<XPD:ATTR name="StereotypeName" type="string">package</XPD:ATTR>';
		newLine;
		indent: 4;
		raw: '<XPD:REF name="Namespace">';
		raw: anXDPPackage parent guid;
		raw: '</XPD:REF>'.
		
	self writeOwnedElementsOf: anXDPPackage indent: 4.
		
	self 
		closeTag: 'XPD:OBJ' indent: 3 newLine: true
]

{ #category : #visiting }
XPDFile >> visitXDPPackageTag: anXDPPackageTag with: anIndex [
	self
		newLine;
		indent: 4; 
		raw: '<XPD:OBJ name="OwnedElements[';
		raw: anIndex asString;
		raw: ']" type="UMLPackage" guid="';
		raw: anXDPPackageTag guid;
		raw: '">';
		newLine.
		
	self 
		indent: 5;
		raw: '<XPD:ATTR name="Name" type="string">';
		raw: anXDPPackageTag name;
		raw: '</XPD:ATTR>';
		newLine;
		indent: 5;		
		raw: '<XPD:ATTR name="StereotypeProfile" type="string">pharo</XPD:ATTR>';
		newLine;
		indent: 5;
		raw: '<XPD:ATTR name="StereotypeName" type="string">packagetag</XPD:ATTR>';
		newLine;
		indent: 5;
		raw: '<XPD:REF name="Namespace">';
		raw: anXDPPackageTag parent guid;
		raw: '</XPD:REF>'.	
		
	self writeOwnedElementsOf: anXDPPackageTag indent: 5.
		
	self 
		closeTag: 'XPD:OBJ' indent: 4 newLine: true
]

{ #category : #visiting }
XPDFile >> visitXDPRealization: aRealization with: anIndex [

	self writeXDPRelationship: aRealization stereotype: 'UMLRealization' with: anIndex
]

{ #category : #visiting }
XPDFile >> visitXDPTrait: anXDPTrait with: anIndex [
	self
		newLine;
		indent: 5; 
		raw: '<XPD:OBJ name="OwnedElements[';
		raw: anIndex asString;
		raw: ']" type="UMLClass" guid="';
		raw: anXDPTrait guid;
		raw: '">'.
		
	self 
		newLine;
		indent: 6;
		raw: '<XPD:ATTR name="Name" type="string">';
		raw: anXDPTrait name;
		raw: '</XPD:ATTR>';
		newLine;
		indent: 6;		
		raw: '<XPD:ATTR name="StereotypeProfile" type="string">pharo</XPD:ATTR>';
		newLine;
		indent: 6;
		raw: '<XPD:ATTR name="StereotypeName" type="string">trait</XPD:ATTR>';
		newLine;
		indent: 6;
		raw: '<XPD:REF name="Namespace">';
		raw: anXDPTrait parent guid;
		raw: '</XPD:REF>'.	
		
	"self writeOwnedElementsOf: anXDPClass indent: 6."
		
	self 
		closeTag: 'XPD:OBJ' indent: 5 newLine: true
]

{ #category : #writing }
XPDFile >> write [
	self writeXMLHeader.
	self writeXDPUnit.
	Clipboard clipboardText: stream contents.
	^ stream contents
]

{ #category : #'private - writing' }
XPDFile >> writeModel [
	self openTag: 'XPD:BODY' indent: 1.
	builder model visit: self.
	self closeTag: 'XPD:BODY' indent: 1 newLine: true.

]

{ #category : #'private - writing' }
XPDFile >> writeOwnedElementsOf: anXDPObject indent: number [

	anXDPObject ownedElements ifNotEmpty: [ 		
		self
			newLine;
			indent: number; 
			raw: '<XPD:ATTR name="#OwnedElements" type="integer">';
			raw: 	anXDPObject ownedElements size asString; 
			raw: '</XPD:ATTR>'.
			
		anXDPObject ownedElements withIndexDo: [:each :index | each visit: self with: index - 1 ]]	
]

{ #category : #'private - writing basic' }
XPDFile >> writeXDPRelationship: aRelationship stereotype: aStereotype with: anIndex [
	self
		newLine;
		indent: 3; 
		raw: '<XPD:OBJ name="OwnedElements[';
		raw: anIndex asString;
		raw: ']" type="';
		raw: aStereotype;
		raw: '" guid="';
		raw: aRelationship guid;
		raw: '">'.
		
	self 
		newLine;	
		indent: 3;
		raw: '<XPD:REF name="Namespace">';
		raw: aRelationship parent guid;
		raw: '</XPD:REF>'.
		
	self 
		newLine;	
		indent: 3;
		raw: '<XPD:REF name="Client">';
		raw: aRelationship from guid;
		raw: '</XPD:REF>'.
	
	self 
		newLine;	
		indent: 3;
		raw: '<XPD:REF name="Supplier">';
		raw: aRelationship to guid;
		raw: '</XPD:REF>'.	
	
	self 
		closeTag: 'XPD:OBJ' indent: 3 newLine: true
]

{ #category : #'private - writing' }
XPDFile >> writeXDPUnit [

	self
		newLine;
		raw: '<XPD:UNIT xmlns:XPD="http://www.staruml.com" version="1">'.
		
	self	
		writeXPDHeader;
		writeModel.
		
	self 
		closeTag: 'XPD:UNIT' indent: 0 newLine: true.
]

{ #category : #'private - writing' }
XPDFile >> writeXMLHeader [

	self 
		raw: '<?xml version="1.0" encoding="UTF-8"?>'
]

{ #category : #'private - writing' }
XPDFile >> writeXPDHeader [

	self 
		openTag: 'XPD:HEADER' indent: 1;
		openTag: 'XPD:SUBUNITS' indent: 2;
		closeTag: 'XPD:SUBUNITS' indent: 2 newLine: true;
		closeTag: 'XPD:HEADER' indent: 1 newLine: true
	
]
