"
Build an XDP model in memory 
"
Class {
	#name : #XPDModelBuilder,
	#superclass : #Object,
	#instVars : [
		'packages',
		'packageTags',
		'model',
		'classes',
		'relations'
	],
	#category : #'XPD-Core-Exporter-Export'
}

{ #category : #'private - accessing' }
XPDModelBuilder >> allSortedPharoPackages [
	"Return a sorted list of all Pharo packages"
	^RPackage organizer packages 
		sorted: [:a1 :a2 | a1 name < a2 name ]
]

{ #category : #building }
XPDModelBuilder >> build [
	<script: 'self new build inspect'>
	self 
		buildModel;
		buildPackages;
		buildRelations
]

{ #category : #'private - building' }
XPDModelBuilder >> buildModel [

	model := XPDModel new.
	
]

{ #category : #'private - building' }
XPDModelBuilder >> buildPackages [

	self allSortedPharoPackages do: [:each | 
		self buildXDPPackageFor: each ].
]

{ #category : #'private - building' }
XPDModelBuilder >> buildRelationBetween: aXPDClass andSuperclass: aXPDClass2 [ 

	model addOwnedElement: (XPDGeneralization from: aXPDClass to: aXPDClass2)
]

{ #category : #'private - building' }
XPDModelBuilder >> buildRelations [
	| superWrapper |
	classes do: [:each | 
		each source superclass ifNotNil: [:sup |
			superWrapper := classes at: sup name asSymbol ifAbsent: [].
			superWrapper ifNotNil: [ self buildRelationBetween: each andSuperclass: superWrapper ]
		]		
	]
]

{ #category : #'private - building' }
XPDModelBuilder >> buildXDPClassFor: aClass in: aXDPPackageTag [ 
	
	|cls|	
	cls := (aClass isTrait 
					ifTrue: [ XPDTrait ]
					ifFalse: [ XPDClass ]) source: aClass.
	aXDPPackageTag addOwnedElement: cls.
	classes at: aClass name asSymbol put: cls.
]

{ #category : #'private - building' }
XPDModelBuilder >> buildXDPPackageFor: anRPackage [

	| package |
	package := XPDPackage source: anRPackage.	
	model addOwnedElement: package.
	packages at: anRPackage name asSymbol put: package.
	(anRPackage actualClassTags 
		sorted: [:a1 :a2 | a1 name < a2 name ]) 
		do: [:each | self buildXDPPackageTagFor: each in: package ]
]

{ #category : #'private - building' }
XPDModelBuilder >> buildXDPPackageTagFor: anRPackageTag in: anXDPPackage [

	| packageTag |
	packageTag := XPDPackageTag source: anRPackageTag.
	anXDPPackage addOwnedElement: packageTag.
	packageTags at: anXDPPackage name asSymbol -> anRPackageTag name asSymbol put: packageTag.
	anRPackageTag classes do: [:each |
		self buildXDPClassFor: each in: packageTag ]
]

{ #category : #'private - initialization' }
XPDModelBuilder >> initialize [
	super initialize.
	packages := Dictionary new.
	packageTags := Dictionary new.
	classes := Dictionary new.
	relations := OrderedCollection new.
]

{ #category : #accessing }
XPDModelBuilder >> model [
	^ model
]
