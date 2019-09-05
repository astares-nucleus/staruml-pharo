"
Build an XDP model in memory 
"
Class {
	#name : #XDPModelBuilder,
	#superclass : #Object,
	#instVars : [
		'packages',
		'packageTags'
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
	
	self buildPackages.
	self inspect
]

{ #category : #'private - building' }
XDPModelBuilder >> buildPackages [

	self allSortedPharoPackages do: [:each | 
		self buildXDPPackageFor: each	].
]

{ #category : #'private - building' }
XDPModelBuilder >> buildXDPPackageFor: anRPackage [

	| package |
	package := XDPPackage source: anRPackage.	
	packages at: anRPackage name asSymbol put: package.
	(anRPackage actualClassTags 
		sorted: [:a1 :a2 | a1 name < a2 name ]) 
		do: [:each | self buildXDPPackageTagFor: each in: package ]
]

{ #category : #'private - building' }
XDPModelBuilder >> buildXDPPackageTagFor: anRPackageTag in: anXDPPackage [

	| packageTag |
	packageTag := XDPPackageTag source: anRPackageTag.
	anXDPPackage addOwnedElement: packageTag.
	packageTags at: anXDPPackage name asSymbol -> anRPackageTag name asSymbol put: packageTag
]

{ #category : #'private - initialization' }
XDPModelBuilder >> initialize [
	super initialize.
	packages := Dictionary new.
	packageTags := Dictionary new.
]
