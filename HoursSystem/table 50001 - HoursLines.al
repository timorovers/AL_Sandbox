table 50001 HoursLines
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Time Sheet No."; Code[20])
        {
            Caption = 'Time Sheet No.';
            TableRelation = "Time Sheet Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Nr; Code[10])
        {
            TableRelation = HoursHeader.Nr;
        }
        field(5; Resource; Code[10])
        {
        }

        field(10; Soort; Option)
        {
            OptionMembers = "Project","Afwezigheid","Service","Intern";
            DataClassification = ToBeClassified;

        }
        field(15; redenafwezigheid; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Afwezigheid reden';
        }
        field(20; Projectnr; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project nr.';
            TableRelation = Job;
        }
        field(25; Projecttaaknr; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project taak nr.';
        }
        field(30; chargeable; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Doorbelast naar klant';
        }
        field(35; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Omschrijving';
        }
        field(40; Maandag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ma';
        }
        Field(45; Dinsdag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Di';
        }
        field(50; Woensdag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Wo';
        }
        field(55; Donderdag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Do';
        }
        field(60; Vrijdag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Vr';
        }
        field(65; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Time Sheet No.", "Line No.")
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