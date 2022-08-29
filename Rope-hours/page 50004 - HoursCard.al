page 50004 HoursCard
{
    PageType = Document;
    SourceTable = "HoursHeader";
    InsertAllowed = true;
    UsageCategory = Administration;
    Editable = true;
    //ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Algemeen)
            {
                field(Nr; rec.Nr)
                {
                    ApplicationArea = All;
                    Caption = 'Nr';
                }
                field(Employee; rec.Employee)
                {
                    ApplicationArea = All;
                    Caption = 'Werknemer';
                }
                field(Startdate; rec.Startdate)
                {
                    ApplicationArea = All;
                    Caption = 'Start datum';
                }
                field(Enddate; rec.Enddate)
                {
                    ApplicationArea = All;
                    Caption = 'Eindatum';
                }
            }
            part(RopeHoursLines; HoursSubform)
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Nr" = FIELD("Nr");
                //SubPageLink = BalieOrderNummer = field(Balieordernummer);
                UpdatePropagation = Both;
                Editable = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Nuke)
            {
                ApplicationArea = all;
                Caption = 'Holidays';
                RunObject = Page Holidays;
                Image = Holiday;
            }
        }
    }

    var
        myInt: Integer;

    procedure test()
    var
        Nr: Record "HoursHeader";
    begin

        if rec.Nr <> xRec.Nr then
            //Message('U heeft het nummer naar %1 gewijzigd', Nr);
            ClearAll();

    end;
}