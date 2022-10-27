tableextension 50200 SalesReceivablesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "BalieOrderNoS"; code[20])
        {
            Caption = 'Balie order nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
