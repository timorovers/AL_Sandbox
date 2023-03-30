enum 50010 "PaymentMethod"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Cash") { Caption = 'Cash'; }
    value(1; "Pin") { Caption = 'Pin'; }
    value(2; "Apple Pay") { Caption = 'Apple Pay'; }
    value(3; "Op rekening") { Caption = 'Op rekening'; }
}