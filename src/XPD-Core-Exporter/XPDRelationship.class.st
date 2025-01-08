"
XDP relationship
"
Class {
	#name : 'XPDRelationship',
	#superclass : 'XPDElement',
	#instVars : [
		'from',
		'to'
	],
	#category : 'XPD-Core-Exporter-Model',
	#package : 'XPD-Core-Exporter',
	#tag : 'Model'
}

{ #category : 'instance creation' }
XPDRelationship class >> from: aClass to: aSuperclass [

	^(self new)
		from: aClass;
		to: aSuperclass;
		yourself
]

{ #category : 'testing' }
XPDRelationship class >> isAbstract [ 
	^self name = #XPDRelationship
]

{ #category : 'accessing' }
XPDRelationship >> from [
	^ from
]

{ #category : 'accessing' }
XPDRelationship >> from: anObject [
	from := anObject
]

{ #category : 'accessing' }
XPDRelationship >> to [
	^ to
]

{ #category : 'accessing' }
XPDRelationship >> to: anObject [
	to := anObject
]

{ #category : 'visiting' }
XPDRelationship >> visit: aVisitor with: argument [

	self subclassResponsibility
]
