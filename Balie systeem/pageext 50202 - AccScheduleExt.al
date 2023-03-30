pageextension 50202 AccScheduleExt extends "Chart of Accounts"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field(Index; rec.Index)
            {
                ApplicationArea = all;
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