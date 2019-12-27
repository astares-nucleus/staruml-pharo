"
XPD exporter for Pharo https://github.com/astares-nucleus/staruml-pharo
"
Class {
	#name : #BaselineOfXPDExporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfXPDExporter
}

{ #category : #baseline }
BaselineOfXPDExporter >> baselineOf: spec [ 
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec package: 'XPD-Core-Exporter'.
			
			"Groups"
			spec
				group: 'Core' with: #('XPD-Core-Exporter');	
				group: 'all' with: #('Core');
				group: 'default' with: #('all') ]
]
