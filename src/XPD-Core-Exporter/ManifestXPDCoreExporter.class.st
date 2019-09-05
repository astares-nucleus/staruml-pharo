"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestXPDCoreExporter,
	#superclass : #PackageManifest,
	#category : #'XPD-Core-Exporter-Manifest'
}

{ #category : #'code-critics' }
ManifestXPDCoreExporter class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#XPDModelBuilder #buildGeneralizations #false)) #'2019-09-05T23:16:05.424943+02:00') )
]
