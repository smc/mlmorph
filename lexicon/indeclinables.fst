% അവ്യയങ്ങൾ - indeclinables. 

% ചോദ്യാവ്യയം:  അവനോ, ഇന്ത്യയോ, കടലോ, മാലയോ, നിറമൊ, പച്ചയോ, വരുമോ, പാടുമോ, ചെയ്യുമോ
$interrogative_particle$ = ഒ | ഓ

% Particle എ is used to indicate 
% 1. A place: പാലക്കാട്ടെ, പടിഞ്ഞാറെ, കിഴക്കെ, മുറ്റത്തെ
% 2. Completeness or intensity: ആകെ, കൂട്ടമെ, ആരുമെ, നാളുമെ 
% 3. Limit: രണ്ടേ, ആളേ, എങ്കിലേ, പാടുകയേ, മാറുകയേ, ഉണരുകയേ
% 4. For questions: അല്ലേ
% 5. To enable nouns to qualify verbs: നന്നേ പുകഴ്ത്തി, സുഖമേ കടന്നു
% - Ref: Gundert - A catechism of Malayalam grammer.

$locative_particle$ = എ | ഏ
% TODO: Not really locative alone as explained above

$indeclinables$ = ( $interrogative_particle$ <interrogative> ) |\
    $locative_particle$ 

$indeclinables$ <indeclinable><RB>