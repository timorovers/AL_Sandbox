page 50003 RopeHoursList
{
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    CardPageID = "HoursCard";
    SourceTable = "HoursHeader";
    UsageCategory = Tasks;
    Editable = false;
    RefreshOnActivate = true;
    Caption = 'Rope hours';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)

            {
                ShowCaption = false;
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
                    Caption = 'Eind datum';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Holidays)
            {
                ApplicationArea = All;
                Caption = 'Holidays';
                Image = Holiday;
                RunObject = Page "holidays";
                //RunPageLink = "Name." = FIELD("Name");


                trigger OnAction()
                begin
                end;
            }
        }
    }

    var
        myInt: Integer;
}