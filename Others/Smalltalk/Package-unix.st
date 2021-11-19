Object subclass: #LuckyClass1
    instanceVariableNames: 'luckyInstanceSideVariable1'
    classVariableNames: 'LuckyClassSideVariable1'
    poolDictionaries: ''
    category: 'Lucky-Package1'!

!LuckyClass1 methodsFor: 'lucky instance side protocol 1' stamp: 'LuckyName 6/8/2016 17:05'!
luckyInstanceSideMethod1
    ^ luckyInstanceSideVariable1 := 'lucky instance side'
! !

!LuckyClass1 class methodsFor: 'lucky class side protocol 1' stamp: 'LuckyName 6/8/2016 17:06'!
luckyClassSideMethod1
    ^ LuckyClassSideVariable1 := 'lucky class side'
! !

LuckyClass1 subclass: #LuckyClass2
    instanceVariableNames: 'luckyInstanceSideVariable2'
    classVariableNames: 'LuckyClassSideVariable2'
    poolDictionaries: ''
    category: 'Lucky-Package1'!

!LuckyClass2 methodsFor: 'lucky instance side protocol 1' stamp: 'LuckyName 6/8/2016 17:15'!
luckyInstanceSideMethod1
    ^ super luckyInstanceSideMethod1, ' subclass'
! !

!LuckyClass2 class methodsFor: 'lucky class side protocol 1' stamp: 'LuckyName 6/8/2016 17:17'!
luckyClassSideMethod1
    ^ super luckyClassSideMethod1, ' subclass'
! !
