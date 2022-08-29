tableextension 50010 CustomerTableExxt extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50001; Geboortedatum; Date)
        { }
        field(50002; Favoerietekleur; Text[20])
        { }
        field(50003; korting; Boolean)
        { }
        field(50004; "Shoe size"; Integer)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if ("Shoe size" < 35) or ("Shoe size" > 50) then
                    FieldError("Shoe size", ShoeSizeError);
            end;
        }


    }

    var
        myInt: Integer;
        ShoeSizeError: Label 'Must be between 36 and 49';
}