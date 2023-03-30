tableextension 50201 GLExt extends "G/L Account"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Index; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Index';

        }
    }

    var
        myInt: Integer;
}