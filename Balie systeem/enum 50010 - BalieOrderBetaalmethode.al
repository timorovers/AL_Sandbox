enum 50010 "Betaalmethode"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Contant") { Caption = 'Contant'; }
    value(1; "Pin") { Caption = 'Pin'; }
    value(2; "Apple Pay") { Caption = 'Apple Pay'; }
    value(3; "Op rekening") { Caption = 'Op rekening'; }
}