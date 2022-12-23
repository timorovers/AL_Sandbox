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
                field(Balieordernummer; rec.Balieordernummer)
                {
                    Caption = 'Balie Order nr';
                }
                field("Bill-to Name"; rec."Bill-to Name")
                {
                    Caption = 'Customer name';
                }
                field("Posting Date"; rec."Posting Date")
                {
                    Caption = 'Posting date';
                }
                field(OrderStatus; rec.OrderStatus)
                {
                    Caption = 'Status';
                    StyleExpr = StatusStyleTxt;
                }
                field(PaymentMethod; rec.PaymentMethod)
                {
                    Caption = 'Payment method';
                }
                field(Notitie; rec.Notitie)
                {
                    Caption = 'Note';
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
                Caption = 'Test report';
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
                    CurrPage.Update();

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















