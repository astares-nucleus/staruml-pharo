"
Build an XDP model in memory 
"
Class {
	#name : 'XPDModelBuilder',
	#superclass : 'Object',
	#instVars : [
		'packages',
		'packageTags',
		'model',
		'classes',
		'relations'
	],
	#category : 'XPD-Core-Exporter-Export',
	#package : 'XPD-Core-Exporter',
	#tag : 'Export'
}

{ #category : 'accessing' }
XPDModelBuilder class >> latestAvailable [
	"Return the most recent available"
	
	|use|
	7 to: SystemVersion current major do: [:version |
		Smalltalk 
			at: (#XPDModelBuilderPharo , version asString) asSymbol
			ifPresent: [:found| use := found ]].
	^ use
]

{ #category : 'private - accessing' }
XPDModelBuilder >> allSortedPharoPackages [
	"Return a sorted list of all Pharo packages"
	| coll |
	coll := (RPackage organizer packages 
				sorted: [:a1 :a2 | a1 name < a2 name ])
				asOrderedCollection.
	coll remove: self class package.
	^coll
]

{ #category : 'private - accessing' }
XPDModelBuilder >> allSortedPharoPackagesDebug [
	"Return a sorted list of all Pharo packages"
	^Array with: (RPackage organizer packages 
		sorted: [:a1 :a2 | a1 name < a2 name ]) first
]

{ #category : 'building' }
XPDModelBuilder >> build [
	<script: 'self new build inspect'>
	self 
		buildModel;
		buildPackages;
		buildRelations
]

{ #category : 'private - building relationships' }
XPDModelBuilder >> buildGeneralizationBetween: aXPDClass andSuperclass: aXPDClass2 [

	| rel |
	rel := XPDGeneralization from: aXPDClass to: aXPDClass2.
	model addOwnedElement: rel.
	relations add: rel
]

{ #category : 'private - building relationships' }
XPDModelBuilder >> buildGeneralizations [
	"We only have one superclass in Pharo"
	
	| superWrapper |
	classes do: [:each | 
		each source superclass ifNotNil: [:sup |
			superWrapper := classes at: sup name asSymbol ifAbsent: [].
			superWrapper ifNotNil: [ self buildGeneralizationBetween: each andSuperclass: superWrapper ]
		]		
	]
]

{ #category : 'private - building' }
XPDModelBuilder >> buildModel [

	model := XPDModel new.
	
]

{ #category : 'private - building' }
XPDModelBuilder >> buildPackages [

	self allSortedPharoPackages do: [:each | 
		self buildXDPPackageFor: each ].
]

{ #category : 'private - building relationships' }
XPDModelBuilder >> buildRealizationBetween: aXPDClass andTrait: aXDPTrait [ 

	| rel |
	rel := XPDRealization from: aXPDClass to: aXDPTrait.
	model addOwnedElement: rel.
	relations add: rel
]

{ #category : 'private - building relationships' }
XPDModelBuilder >> buildRealizations [
	"check for the traits"
	
	| traitWrapper |
	classes do: [:each | 
		each source traits do: [:trait |
			traitWrapper := classes at: trait name asSymbol ifAbsent: [].
			traitWrapper ifNotNil: [ self buildRealizationBetween: each andTrait: traitWrapper ]]]
]

{ #category : 'private - building' }
XPDModelBuilder >> buildRelations [
	self 
		buildGeneralizations;  "for superclass inheritance"
		buildRealizations  	  "for Traits"
]

{ #category : 'private - building' }
XPDModelBuilder >> buildUntaggedClassesFor: anRPackage in: package [


	| untagged |
	untagged := anRPackage classes select: [ :each |
					 each packageTag name = #Uncategorized
						or: [ each packageTag = each packageTag isUndefined ] ].
	untagged do: [ :each | self buildXDPClassFor: each in: package ]
]

{ #category : 'private - building' }
XPDModelBuilder >> buildXDPClassFor: aClass in: aXDPPackageTag [ 
	
	|cls|	
	cls := (aClass isTrait 
					ifTrue: [ XPDTrait ]
					ifFalse: [ XPDClass ]) source: aClass.
	aXDPPackageTag addOwnedElement: cls.
	classes at: aClass name asSymbol put: cls.
]

{ #category : 'private - building' }
XPDModelBuilder >> buildXDPPackageFor: anRPackage [

	| package   |
	package := XPDPackage source: anRPackage.
	model addOwnedElement: package.
	packages at: anRPackage name asSymbol put: package.
	(anRPackage actualClassTags sorted: [ :a1 :a2 | a1 name < a2 name ])
		do: [ :each | self buildXDPPackageTagFor: each in: package ].

	self buildUntaggedClassesFor: anRPackage in: package
]

{ #category : 'private - building' }
XPDModelBuilder >> buildXDPPackageTagFor: anRPackageTag in: anXDPPackage [

	| packageTag |
	packageTag := XPDPackageTag source: anRPackageTag.
	anXDPPackage addOwnedElement: packageTag.
	packageTags at: anXDPPackage name asSymbol -> anRPackageTag name asSymbol put: packageTag.
	anRPackageTag classes do: [:each |
		self buildXDPClassFor: each in: packageTag ]
]

{ #category : 'private - initialization' }
XPDModelBuilder >> initialize [
	super initialize.
	packages := Dictionary new.
	packageTags := Dictionary new.
	classes := Dictionary new.
	relations := OrderedCollection new.
]

{ #category : 'accessing' }
XPDModelBuilder >> model [
	^ model
]
