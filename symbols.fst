#Vowels# = അആഇഈഉഊഋഎഏഐഒഓഔഔ
#VowelSigns# = ാിീുൃെേൊോൗൂൈ
#Anuswara# = ം
#Virama# = ്
#Visarga# = ഃ
#Consonants# = കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറ
#Chillus# = ൻർൽൾൿൺ
#ZWNJ# = ‌

% all possible character in Malayalam
#Letters# = #Consonants##Vowels##VowelSigns##Anuswara##Chillus##Virama##Visarga##ZWNJ#

% POS tags
#verbs# = <v><passive-voice><causative-voice>
#MALAYALAMPOS# = <adj><adv><dem><n><np><prn><postp><ij><cnj><qn><vaux><num><pnct><deriv> \
	<Noun><punct><prep><postp><indeclinable><interrogative><aff><neg><quantifier><cardinal><ordinal> \
	<0><1><2><3><4><5><6><7><8><9> \
	<masculine><feminine><neutral> \
	#verbs#

#POS# = #MALAYALAMPOS# <eng><sanskrit>

% Boundary markers
#BM#  = <LB><RB><MB>
#Numbers# = <one><two><three><four><five><six><seven><eight><nine><ten><zero>\
  <ones><half><tens><hundreds><thousands><lakhs><crores>

% other intermediate symbols
#TMP# = <LN><BoW><EoW><infl_marker>

#Digit# = 0123456789
#Perc# = \%
#Nsep# = \.\,
#Apos# = \'
#Punct# = \.\?\!\:\,\;\@\#\^\&\*\(\)\'\"\`\~\>\<\-/–\[\]‘’“”—·

% analysis symbols for compounding(സമാസം)
% determinative is Tatpuruṣa, coordinative is Dwanda Samasam, possessive is Bahuvrihi
#compounds# = <coordinative><determinative><possessive><n-v-compound>

% analysis symbols for inflectional suffixes
#ninfl# = <accusative><vocative><nominative><genitive><dative>\
	<instrumental><locative><sociative><allative><ablative><perlative>\
	<sg><pl>

#aspects# = <simple-perfect-aspect><cont-perfect-aspect><remote-perfect-aspect> \
	<simple-perfect-aspect-neg><cont-perfect-aspect-neg><remote-perfect-aspect-neg> \
	<habitual-aspect><iterative-aspect><iterative-past-aspect><iterative-present-aspect><iterative-future-aspect> \
	<emphatic-iterative-past-aspect><emphatic-iterative-present-aspect><emphatic-iterative-future-aspect>

#moods# = <imperative-mood><compulsive-mood><compulsive-mood-neg><promissive-mood> \
	<optative-mood><purposive-mood><abilitative-mood><permissive-mood> \
	<precative-mood><precative-neg-mood><irrealis-mood><monitory-mood> \
	<conditional-mood><satisfactive-mood><quotative-mood><desiderative-mood>

#adv# = <cvb-adv-part-future><cvb-adv-part-conditional> \
	<cvb-adv-part-past><cvb-adv-part-absolute> \
	<adv-clause-rp-past><adv-clause-rp-present> \
	<adv-clause-rp-past-neg><adv-clause-rp-present-neg> \
	<cvb-adv-part-simul><cvb-adv-part-past-simul>

#vinfl# = <past><future><present><concessive>#aspects##moods##adv#

#infl# = #ninfl##vinfl#
%%%%% some character classes that are helpful
#Lsym# = <del><dels><dup><plural><ninfl>

% Stop tag to prevent further agglutination or inflection after the word.
#Special# = <stop>

% surface symbols
#Ssym# =#Letters##Digit##Punct##Perc##Nsep##Apos#

% Only the symbols that appear in analysis strings. (this excludes
% the intermediate symbols like morpheme boundaries,)
%

#Asym# = #Ssym##POS##Numbers##infl##compounds#

%
% All analysis symbols, including the intermediate ones.
%

#AAsym# = #Asym##BM##TMP##Lsym##Special#
