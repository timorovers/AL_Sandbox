pageextension 50200 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field(BalieOrderNoS; rec.BalieOrderNoS)
            {
                Caption = 'Balie order nos';
                ApplicationArea = All;
            }
        }
    }
}