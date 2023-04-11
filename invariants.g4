grammar invariants;

invariant
      : 'EVENTS' '(' events ')' '\n'?
        'WHERE' '\n'?
        ('ORDERING' orderings)? '\n'?
        'WITHIN' INT TIME
      | 'EVENTS' '(' events ')' '\n'?
        'WHERE' '\n'?
        ('ORDERING' orderings)? '\n'?
        'WINDOW' INT TIME
        ;


events: event (',' event)*;
event: eventSchema eventId;
eventSchema: IDENTIFIER;
eventId: TEXT;

orderings: ordering ('OR' ordering)*;
ordering: '<' TEXT (',' TEXT)* '>';

qualifiedName
    : TEXT ('.' TEXT)*
    ;

INT: [0-9]+;
IDENTIFIER
    : (LETTER | DIGIT | '_')+
    ;
TIME
    : 'sec'
    | 'min'
    | 'hour'
    ;
DIGIT: [0-9];
LETTER: [A-Z];
TEXT: [a-z]+;



WS: [ \t\n\r\f]+ -> skip ;