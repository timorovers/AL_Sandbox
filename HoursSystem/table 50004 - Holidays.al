table 50004 Holidays
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Timo Rovers","Peter Derks","Kayleigh Vullings","Roel Verbruggen";
            Editable = true;
            trigger OnValidate()
            begin
                if rec.name <> xrec.name then
                    ClearAll();
            end;
        }
        field(5; DaysTotal; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            MaxValue = 35;

        }
        field(10; DaysTaken; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            trigger OnValidate()
            begin
                DaysRemaining := DaysTotal - DaysTaken;
            end;
        }
        field(15; DaysRemaining; Decimal)
        {
        }
        field(20; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;




    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


}