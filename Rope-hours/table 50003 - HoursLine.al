table 50003 RopeHoursLine
{
    //DataClassification = ToBeClassified;
    DrillDownPageID = "HoursLines";
    LookupPageID = "HoursLines";
    Caption = 'RopeHoursLine';

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
            OptionMembers = "Service","Intern","Afwezigheid","Project";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                case Soort of
                    Soort::Afwezigheid:
                        Projectnr := '';

                    //Projecttaaknr := '';
                    Soort::Intern:
                        Projectnr := '';

                    Soort::Service:
                        Projectnr := '';

                    Soort::Project:
                        Chargeable := true;
                end;

            end;





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
            trigger OnValidate()
            begin
                if rec.Projectnr <> xRec.Projectnr then begin
                    if Projectnr <> '' then begin
                        Projecttaaknr := '';
                    end;
                end;
            end;
        }
        field(25; Projecttaaknr; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project taak nr.';
            TableRelation = "Job Task";

        }
        field(30; chargeable; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Klant moet betalen';
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
        field(65; Zaterdag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Za';
        }
        field(70; Zondag; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Zo';
        }
        field(75; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            Editable = false;
            CalcFormula = Sum("ropehoursline".Quantity WHERE("Time Sheet No." = FIELD("Time Sheet No."),
                                                                  "Line No." = FIELD("Line No.")));
            FieldClass = FlowField;
            trigger OnValidate()
            begin
                CalcSums(Maandag, Dinsdag, Woensdag, Donderdag, Vrijdag);
            end;
        }
        field(80; "Startdate"; date)
        {
        }
        field(85; "Enddate"; Date)
        {
        }
        field(90; Quantity; Decimal)
        {
            Caption = 'Quantity';
            Editable = false;
        }
    }

    keys
    {
        key(PM; Nr, "Line No.")
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