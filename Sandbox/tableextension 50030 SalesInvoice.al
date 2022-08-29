tableextension 50030 SalesInvoice extends "Sales Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50123; ItemColor; Option)
        {
            OptionMembers = Red,Orange,Yellow,Green,Blue,Indigo,Violet;
        }

    }

    var
        myInt: Integer;
}