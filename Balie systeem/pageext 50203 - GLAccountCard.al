pageextension 50203 GLAccountCard extends "G/L Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field(Index; rec.Index)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}