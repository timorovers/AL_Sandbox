pageextension 50030 SalesInvoice extends "Sales Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field("BalieOrder"; REC.BalieOrder)
            {
                ApplicationArea = all;
                Caption = 'Balie Order';
            }
        }
    }
}