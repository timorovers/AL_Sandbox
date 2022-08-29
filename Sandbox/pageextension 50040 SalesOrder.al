pageextension 50040 SalesOrder extends "Sales Order"

{
    layout
    {
        addafter("Due Date")
        {
            field("BalieOrder"; REC.BalieOrder)
            {
                ApplicationArea = all;
                Caption = 'Balie order';
            }
        }
    }
}