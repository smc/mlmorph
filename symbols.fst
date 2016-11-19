#Vowels# = അആഇഈഉഊഋഎഏഐഒഓഔഔഅം
#VowelSigns# = ാിീുൃെേൊോൗൂൈ
#Anuswara# = ം
#Virama# = ്
#Consonants# = കഖഗഘങചഛജഝഞടഠഡഢണതഥദധനപഫബഭമയരലവശഷസഹളഴറ
#Chillus# = ൻർൽൾൿൺ

% POS tags
#pos# = <adj><adv><n><np><prn><postp><ij><cnj><v><vaux><num><pnct>
#BM#  = <RB><MB>    % Boundary markers
#numbers# = <one><two><three><four><five><six><seven><eight><nine><ten><zero>\
  <ones><half><tens><hundred><hundreds><thousand>
% other intermediate symbols (this should probalby contain
% <K><D><C><A><I>, we assume they may appear in lexicon for some
% reason)

#TMP# = <LN><BoW><EoW>

#Digit# = 0123456789
#Perc# = \%
#Nsep# = \.\,
#Apos# = \'
#Punct# = \.\?\!\:\,\;


% types of cuasative markers, some of them are lexicalzed
%
% note that the lexical markers for reflexive and reciprocal is
% different than the corresponding analysis symbols.
%
#caus_types# = <caus_dir><caus_t><caus_it><caus_ir><caus_ar><caus_art><caus_irreg>
#aor_types# = <aor_ir><aor_ar>
#refl# = <rfl>
#recp# = <rcp>

#infl_feat# = #caus_types##aor_types##refl##recp#


% all possible character in the lexicon (??)
#lex_char# = #Consonants##Vowels##VowelSigns##Anuswara##Chillus##Virama#

% analysis symbols for derivational suffixes

#deriv# = <D_AcIK><D_CA><D_CAK><D_CAgIz><D_CI><D_CIK><D_IcIK>\
          <D_IncI><D_ca><D_cil><D_gil><D_lA><D_lAn><D_lAs><D_lI>\
          <D_lIK><D_mA><D_mAdIK><D_sAl><D_sAr><D_sa><D_siz><D_yIS>\
          <Dan_0><Djn_0><Dmn_0><Dnn_siz><Dvn_yIcI>

% analysis symbols for inflectional suffixes
#infl# = <ref><rec><caus><pass>\
         <abil><iver><adur><agel><agor><akal><akoy><ayaz>\
         <neg> \
         <t_narr><t_past><t_fut><t_cont><t_aor>\
         <t_imp><t_makta><t_obl><t_opt><t_cond>\
         <cpl_di><cpl_mis><cpl_sa><cpl_ken>\
         <1s><2s><2sf><3s><1p><2p><3p>\
         <vn><part><cv>\
         <dir>\
         <pl>\
         <p1s><p2s><p3s><p1p><p2p><p3p>\
         <loc><gen><acc><abl><dat><ins>\
         <ki>\
         <ca>\
         <apos>
%%%%% some character classes that are helpful

% surface symbols
#Ssym# = #Consonants##Vowels##VowelSigns##Anuswara##Chillus##Virama##Digit##Punct##Perc##Nsep##Apos#

% special symbols that mark exceptions in the lexicon
% By default, LEsymS are the symbols that are removed from the analyses.
% The others are replaced with the corresponding surface symbol.

#LEsymS# = #infl_feat#<compn><del><dels><dup><yn>
#LEsym# = #LEsymS#

% All lexical symbos:

#Lsym# = #Ssym##LEsym##numbers#

%
% Only the symbols that appear in analysis strings. (this excludes
% the intermediate symbols like morpheme boundaries,)
%

#Asym# = #Ssym##pos##deriv##infl#

%
% All analysis symbols, including the intermediate ones.
%

#AAsym# = #Asym##BM##TMP#
