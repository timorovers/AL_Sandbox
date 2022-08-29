table 50002 HoursHeader
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Nr; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Urenstaat nr.';
            Editable = true;
        }
        field(5; Startdate; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Begindatum';
            Editable = true;
            trigger OnValidate()
            var
                InputDate: Date;

            begin
                //InputDate := WorkDate();
                Enddate := CalcDate('7D', Startdate);
            end;
        }
        field(10; Enddate; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Einddatum';
            Editable = true;
        }
        field(15; Employee; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Timo Rovers","Kayleigh Vullings","Roel Verbruggen","Peter Derks";
            Caption = 'Werknemer';
            Editable = true;
        }
        field(20; HolidaysLeft; Decimal)
        {
            Width = 3;
        }
    }


    keys
    {
        key(Key1; Nr)
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