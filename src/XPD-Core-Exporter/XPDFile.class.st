"
An XPD file

See http://www.cs.sjsu.edu/faculty/pearce/modules/projects/oop/codeGen/codeGen.htm
"
Class {
	#name : #XPDFile,
	#superclass : #Object,
	#instVars : [
		'stream'
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

{ #category : #initialization }
XPDFile >> initialize [ 
	super initialize.
	stream := String new writeStream
]

{ #category : #'private - writing basic' }
XPDFile >> newLine [
	stream crlf 
]

{ #category : #'private - writing basic' }
XPDFile >> openTag: aTag indent: times [

	times timesRepeat: [ stream tab ].
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

{ #category : #writing }
XPDFile >> write [ 
	self writeIntro.
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
XPDFile >> writeOutro [ 
	
	stream closeTag: 'XPD:UNIT' indent: 0
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
