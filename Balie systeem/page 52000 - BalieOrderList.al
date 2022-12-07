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
                    Caption = 'Customer name';
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    Caption = 'Posting date';
                    ApplicationArea = All;
                }
                field(OrderStatus; rec.OrderStatus)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                    StyleExpr = StatusStyleTxt;
                }
                field(PaymentMethod; rec.PaymentMethod)
                {
                    Caption = 'Betaalmethode';
                    ApplicationArea = All;
                }
                field(Notitie; rec.Notitie)
                {
                    Caption = 'Note';
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
                Caption = 'Test report';
                Ellipsis = true;
                Image = TestReport;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';
                trigger OnAction()
                var
                    BalieOrderReport: Report BalieOrderReport;
                begin
                    rec.TestField(Balieordernummer); //TRO|7-12-2022
                    BalieOrderReport.SetTableView(rec);
                    BalieOrderReport.RunModal();
                    rec.setrange(Balieordernummer); //TRO|7-12-2022

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















