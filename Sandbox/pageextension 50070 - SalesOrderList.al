pageextension 50105 SalesOrderListExt extends "Sales Order List"
{
    actions
    {
        addafter("Print Confirmation")
        {
            action(PrintSelectedLayout)
            {
                Caption = 'Print Selected Layout';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category8;
                trigger OnAction()
                var
                    ReportLayoutSelection: Record "Report Layout Selection";
                    SalesHeader: Record "Sales Header";
                    TimoLayouts: Label 'Timo Test Layout 01,Timo Test Layout 02';
                    Selection: Integer;
                begin
                    SalesHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesHeader);
                    Selection := StrMenu(TimoLayouts);
                    case Selection of
                        1:
                            ReportLayoutSelection.SetTempLayoutSelected('1305-000002');
                        2:
                            ReportLayoutSelection.SetTempLayoutSelected('1305-000004');
                        3:
                            ReportLayoutSelection.SetTempLayoutSelected('1305-000003');
                        else
                            exit;
                    end;
                    Report.Run(Report::"Standard Sales - Order Conf.", true, true, SalesHeader);
                end;
            }
        }
    }
}