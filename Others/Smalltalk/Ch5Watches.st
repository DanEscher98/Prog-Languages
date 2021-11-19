#!/usr/bin/gst -f

Object subclass: Watch [
	| style cronometer |
	<comment: 'A class to define ordinary watches.'>

	setStyle: theStyle [
		style := theStyle.
	]
	getStyle [
		^style
	]
	setCronoFeatures: theCronoFeature [
		cronometer := theCronoFeature.
	]
	getCronoFeatures [
		^cronometer
	]
	listFeatures [
		Transcript show: ('Sytle: ', self getStyle); cr.
		Transcript show: ('Cronometer Features: ', (self getCronoFeatures) printString); cr.
	]
]

Watch subclass: waterProofWatch [
	| resistanceDepth |
	<comment: 'A class to define'>

	setResistanceDepth: aDepth [
		resistanceDepth := aDepth.
	]
	getResistanceDepth [
		^resistanceDepth
	]
	listFeatures [
		super listFeatures.
		Transcript show: ('Resistance Depth: ', (self getResistanceDepth) printString, ' meters.'); cr.
	]
]

| watch1 watch2 |

watch1 := Watch new.
watch1 setStyle: 'Analog'.
watch1 setCronoFeatures: true.
watch1 listFeatures.

Transcript cr.

watch2 := waterProofWatch new.
watch2 setStyle: 'Digital'.
watch2 setCronoFeatures: true.
watch2 setResistanceDepth: 20.
watch2 listFeatures.
