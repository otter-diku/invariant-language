grammar invariants;

invariant
      : EVENTS '(' events ')' '\n'?
        WHERE '\n'?
        ORDERING? '\n'?
        WITHIN
      | EVENTS '(' events ')' '\n'?
        WHERE '\n'?
        ORDERING? '\n'?
        WINDOW
        ;

WS: [ \t]+ -> skip ; // toss out whitespace    

events: event (',' event)*;
event: eventSchema eventId;
eventSchema: IDENTIFIER;
eventId: TEXT;

EVENTS: 'EVENTS';
WHERE: 'WHERE';
WITHIN: 'WITHIN';
ORDERING: 'ORDERING';
WINDOW: 'WINDOW';

TEXT : [a-z]+;
IDENTIFIER
    : (LETTER | DIGIT | '_')+
    ;

fragment DIGIT
    : [0-9]
    ;

fragment LETTER
    : [A-Z]
    ;
