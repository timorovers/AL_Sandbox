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
            //Excel export>>
            action(ExporToExcel)
            {
                Caption = 'Export to Excel';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                var
                begin
                    ExportBalieOrders(rec);
                end;
            }
            //Excel export<<

        }
    }

    var
        StatusStyleTxt: Text;

    trigger OnAfterGetRecord()
    begin
        StatusStyleTxt := rec.GetStatusStyleText();
    end;

    //Excel export>>
    local procedure ExportBalieOrders(var BalieOrdersRec: Record BalieOrderHeader)
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        BalieOrderHeaderLbL: Label 'Balie Orders';
        ExcelFileName: Label 'Balie Orders_%1_%2';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(BalieOrdersRec.FieldCaption("Balieordernummer"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(BalieOrdersRec.FieldCaption("Bill-to Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(BalieOrdersRec.FieldCaption(OrderStatus), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        if BalieOrdersRec.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(BalieOrdersRec.Balieordernummer, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(BalieOrdersRec."Bill-to Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(BalieOrdersRec.OrderStatus, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
            until BalieOrdersRec.Next() = 0;
        TempExcelBuffer.CreateNewBook(BalieOrderHeaderLbL);
        TempExcelBuffer.WriteSheet(BalieOrderHeaderLbL, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();


    end;




    //Excel export<<


}















