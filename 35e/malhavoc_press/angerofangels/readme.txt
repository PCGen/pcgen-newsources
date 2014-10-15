
5/28/2004
	They're are actually quite a few things in here that were working once 
		(after a *fashion*, at least) that are now broken :/ Problem 
		things are mostly commented out, just don't try to make a 
		hashmalim...
	NAMEISPI'd and DESCISPI'd everything that wasn't completely an 
		artifact of PCGen (such as Morph and Qualify templates)
	skipped over NAMEISPI'ing prestige class names as well... right?
	looks like I actually missed a few SOURCE tags, as well :O
		a LOT of sourcepage tags...
	In 5.7.1, PREEQUIP is broken--Hashalite buggy
	SA is having problems displaying 0s--Wild Empathy from Angelic Animal Affinty
		won't always display
	(I expanded Angelic Animal Affinty to display the type of animal and bonus)
	PRETYPE:Outsider (etc) still isn't working (in template files)
	Changed all names to singular (Hashmalite instead of Hashmalim)
	shortened name from Heavenborn Angel to Heavenborn (they're kinda called both)
	Making character files of example Heavenborn
		both to spot bugs and replacement for PREDEFAULTMONSTER
	I always listed immunities as "Immunity to Foo" so they'd be next to each other
		--the text usually has it as "Foo Immunity"


3/21/2004
PCGen keeps thinking PRETYPE in templates is the global equipment PRETYPE tag
I think this bug existed in 5.6r2/3, was fixed in 5.6, and is now broken again


12/18/2003 22:27 EST
somewhere in Cachalachi

I'm using emacs, it's not a word processor, so this text may show up funky :/

This was mostly done with PCGen v 5.5.2 - forgive me if things have been 
	changed/addressed since then

I'm not really done with this, but I'm definitely at the point of diminishing
	returns for the amount of time I'm putting into it.
I'll try to continue to root out bugs, etc.
Hopefully someone will code the stuff I've been too lazy to do O:D

Wishlist:
	Subtypes. thru templates, a tag, whatever.
	RESISTANCE & IMMUNITY tags. for instance, so you could have a template
		with IMMUNITY:Petrification, applied to a creature with 
		IMMUNITY:Fire, would show up under abilities as 
		"Immunities (Fire, Petrification)--something like that. 
		would make immunities easier to check for PREREQ's. maybe.
	Resistances could be made modifiable just by defining vars (like i've 
		done :D) and sticking to some kind of standard
	Ability to give templates thru feats - make TEMPLATE: tag global?
	Ability to access Level Adjustment. a global var "LA"?
	Ability to use .COPY tag on spells (for spells that are "As foo, 
		but..." would save much time, not to mention that sources 
		usually don't give the reduntant stats for the copied spell)
		(this may work by now, I don't know)	

Workarounds, Kludges, and Hacks:
	I made various Qualify (foo) templates. These allow you to bypass 
		certain "fuzzy" prerequisites (Angel, fire resistance/immunity,
		 etc)
	I've made energy resistances variables, so that Improved Energy 
		Resistance will properly increase them.
	Created Chaotic,Evil,Good,Lawful,Fire,Cold templates, similiar to how 
		rsrd .lst files have done for Native, Water.
		Are those templates defunct? I don't think they're used. don't
		 think 1/2 of the templates in that file are used...
	The feats Great Claws and Fiendish Tail give an extra (or greater)
		natural attack--NATURALATTACKS tag won't work with feats, so
		I've made "Great Claws" and "Fiendish Tail" templates that have
		the respective feats as a prerequisite.
	Improved Damage Reduction implemented with VARs -- won't work outside of AoA's races
		I haven't MOD'd this for the rsrd races due to things like
		"DR x/cold iron or good", etc
	the Template Classes and HD are done funky, but appear to work--look at comments in
		the angerofangels_class_template.lst file
	
Issues:
	I think the Hashmalite's turn undead ability still isn't jiving well 
		with Turn undead from other sources, needs work
	Haven't implemented Improved Damage Reduction, Extra Spell-like
		ability. I don't know of any way how to.
	Minor Spell Resistance grants SR based on ECL--I don't know of any way
		to access ECL/LevelAdjustment within .lst files
	Celestial/Infernal Sorcery isn't working
	PRESPELL isn't catching innate spell-like abilities?
	Extra Spell-like Ability probably can't be done with PCGen as it is now
	CHOOSE:NUMBER isn't working in feats
	other stuff. plenty of other stuff.
	Vrykolaka template has all HD change to d12's -- can't do?
	Some of the natural attacks aren't working right--
		The theriofiend template gives a claw and bite attack,
		The bite can be equipped as Primary natural weapon,
		but it's wanting to like, carry the claws :/
		(I haven't looked at this lately)

-Mike (brainface_mike)

new changes:
	Agrippa and Gibborite had (!)PREALIGN:Chaotic instead of Evil
	woo! tab spacing now set to 6!
	barak showed how to do sized natural attacks with templates ;)
	Large Angelform now works =O
	Continued maintenance to make things work with new versions of PCGen and
		rsrd list files
	Vrykolaka template added =O
