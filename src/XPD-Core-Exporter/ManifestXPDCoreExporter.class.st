"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestXPDCoreExporter',
	#superclass : 'PackageManifest',
	#category : 'XPD-Core-Exporter-Manifest',
	#package : 'XPD-Core-Exporter',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestXPDCoreExporter class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'XPD-Core-Exporter')) #'2025-01-08T01:23:12.08+01:00') )
]

{ #category : 'code-critics' }
ManifestXPDCoreExporter class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#XPDModelBuilder #buildGeneralizations #false)) #'2019-09-05T23:16:05.424943+02:00') )
]

{ #category : 'code-critics' }
ManifestXPDCoreExporter class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'XPDModelBuilder class' #latestAvailable #true)) #'2025-01-08T00:56:59.835+01:00') )
]

{ #category : 'code-critics' }
ManifestXPDCoreExporter class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'XPDModelBuilder class' #latestAvailable #true)) #'2025-01-08T00:55:22.972+01:00') )
]
