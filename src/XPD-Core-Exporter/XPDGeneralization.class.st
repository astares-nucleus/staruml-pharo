Class {
	#name : #XPDGeneralization,
	#superclass : #XPDElement,
	#instVars : [
		'from',
		'to'
	],
	#category : #'XPD-Core-Exporter-Model'
}

{ #category : #'instance creation' }
XPDGeneralization class >> from: aClass to: aSuperclass [

	^(self new)
		from: aClass;
		to: aSuperclass;
		yourself
]

{ #category : #accessing }
XPDGeneralization >> from [
	^ from
]

{ #category : #accessing }
XPDGeneralization >> from: anObject [
	from := anObject
]

{ #category : #accessing }
XPDGeneralization >> to [
	^ to
]

{ #category : #accessing }
XPDGeneralization >> to: anObject [
	to := anObject
]

{ #category : #visiting }
XPDGeneralization >> visit: aVisitor with: argument [

	aVisitor visitXDPGeneralization: self with: argument
]
