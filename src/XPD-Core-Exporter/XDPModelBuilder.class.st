"
Build an XDP model in memory 
"
Class {
	#name : #XDPModelBuilder,
	#superclass : #Object,
	#instVars : [
		'packages'
	],
	#category : #'XPD-Core-Exporter-Export'
}

{ #category : #'private - accessing' }
XDPModelBuilder >> allSortedPharoPackages [
	"Return a sorted list of all Pharo packages"
	^RPackage organizer packages 
		sorted: [:a1 :a2 | a1 name < a2 name ]
]

{ #category : #building }
XDPModelBuilder >> build [
	<script: 'self new build'>
	
	self allSortedPharoPackages do: [:each | 
		self buildXDPPackageFor: each	
	].
self inspect
]

{ #category : #building }
XDPModelBuilder >> buildXDPPackageFor: anRPackage [

	| package |
	package := XDPPackage new.
	package name: anRPackage name.
	packages at: anRPackage name asSymbol put: package
]

{ #category : #'private - initialization' }
XDPModelBuilder >> initialize [
	super initialize.
	packages := Dictionary new.
]
