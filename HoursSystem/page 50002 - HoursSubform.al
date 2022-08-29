page 50002 HoursSubform
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Hoursline";
  
    MultipleNewLines = true;
    Editable = true;


    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Nr; rec.Nr)
                {
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line no';
                    Editable = true;
                }
                field(Soort; rec.Soort)
                {
                    ApplicationArea = All;
                    Caption = 'Soort';
                    Editable = true;
                }
                field(Projectnr; rec.Projectnr)
                {
                    ApplicationArea = All;
                    Caption = 'Projectnr';
                    Editable = true;
                }
                field(Projecttaaknr; rec.Projecttaaknr)
                {
                    ApplicationArea = All;
                    Caption = 'Project taaknr';
                    Editable = true;
                }
                field(chargeable; rec.chargeable)
                {
                    ApplicationArea = All;
                    Caption = 'Klant moet betalen';
                    Editable = true;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Omschrijving';
                    Editable = true;
                }
                field(Maandag; rec.Maandag)
                {
                    ApplicationArea = All;
                    Caption = 'Ma';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                }
                field(Dinsdag; rec.Dinsdag)
                {
                    ApplicationArea = All;
                    Caption = 'Di';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                }
                field(Woensdag; rec.Woensdag)
                {
                    ApplicationArea = All;
                    Caption = 'Wo';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                }
                field(Donderdag; rec.Donderdag)
                {
                    ApplicationArea = All;
                    Caption = 'Do';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                }
                field(Vrijdag; rec.Vrijdag)
                {
                    ApplicationArea = All;
                    Caption = 'Vr';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                }
                field(Zaterdag; rec.Zaterdag)
                {
                    ApplicationArea = all;
                    Caption = 'Za';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                    trigger OnValidate()
                    begin
                        if rec.Zaterdag <> xRec.Zaterdag then
                            rec.Validate(Zaterdag, rec.Zaterdag * 2);
                        Message('Op zaterdag betaald de klant dubbel tarief dus %1 uur', Rec.zaterdag);
                    end;
                }
                field(Zondag; rec.Zondag)
                {
                    ApplicationArea = all;
                    Caption = 'Zo';
                    Editable = true;
                    Width = 3;
                    DecimalPlaces = 0 : 2;
                    trigger OnValidate()
                    begin
                        if rec.Zondag <> xRec.Zondag then
                            rec.Validate(Zondag, rec.Zondag * 2);
                        Message('Op zondag betaald de klant dubbel tarief dus %1 uur', Rec.Zondag);
                    end;
                }
                field("Total Quantity"; rec."Total Quantity")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Totaal';
                    DecimalPlaces = 0 : 2;
                    Width = 3;
                    StyleExpr = 'Strong';
                }
            }
        }
    }
    var
        myInt: Integer;
}