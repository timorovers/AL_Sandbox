page 52003 "BalieOrderList"
{
    //DataCaptionFields = "Betaalmethode";
    Editable = false;
    PageType = List;
    SourceTable = "BalieOrderHeader";
    Caption = 'Balie orders';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = BalieOrderCard;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Balieordernummer; rec.Balieordernummer)
                {
                    Caption = 'Balie order nr';
                    ApplicationArea = All;
                }
                field("Bill-to Name"; rec."Bill-to Name")
                {
                    Caption = 'Klantnaam';
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    Caption = 'Boekingsdatum';
                    ApplicationArea = All;
                }
                field(OrderStatus; rec.OrderStatus)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                    StyleExpr = StatusStyleTxt;
                }
                field(Notitie; rec.Notitie)
                {
                    Caption = 'Notitie';
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Test Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Afdrukvoorbeeld';
                Ellipsis = true;
                Image = TestReport;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';
                trigger OnAction()
                var
                    BalieOrderReport: Report BalieOrderReport;
                begin
                    BalieOrderReport.SetTableView(rec);
                    BalieOrderReport.RunModal();
                end;
            }

        }
    }
    var
        StatusStyleTxt: Text;

    trigger OnAfterGetRecord()
    begin
        StatusStyleTxt := rec.GetStatusStyleText();
    end;

}















