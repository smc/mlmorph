% Polarity: In linguistics and grammar, affirmative and negative (abbreviated respectively AFF and NEG)
% are terms of opposite meaning which may be applied to statements, verb phrases, clauses, or other utterances.
% Essentially an affirmative (positive) form is used to express the validity or truth of a basic assertion,
% while a negative form expresses its falsity. Examples are the sentences "Jane is here" and "Jane is not here";
% the first is affirmative, while the second is negative.
% The grammatical category associated with affirmative and negative is called polarity.
% This means that a sentence, verb phrase, etc. may be said to have either affirmative or
% negative polarity (its polarity may be either affirmative or negative).

$POLARITY$ = "affirmatives.lex" <aff> \
	| "negations.lex" <neg>

<LB> $POLARITY$ <RB>
