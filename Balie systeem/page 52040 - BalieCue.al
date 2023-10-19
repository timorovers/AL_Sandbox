page 52040 BalieCue
{
    PageType = CardPart;
    SourceTable = BalieOrderCueTable;

    layout
    {
        area(content)
        {
            cuegroup(BalieOrders)
            {
                Caption = 'Balie orders';
                // CuegroupLayout=Wide;
                field(BalieOrdersVrijgegeven; rec.BalieOrdersVrijgegeven)
                {
                    Caption = 'Released';
                    DrillDownPageId = "BalieOrderList";
                    ApplicationArea = All;
                }
                field(BalieOrdersOpen; rec.BalieOrdersOpen)
                {
                    Caption = 'Open';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
                field(BalieOrdersGearchiveerd; rec.BalieOrdersGearchiveerd)
                {
                    Caption = 'Archived';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
                field(TotaalBalieOrders; rec.TotaalBalieOrders)
                {
                    Caption = 'All balie orders';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
                field(AverageCashPayment; rec.AverageCashPayment)
                {
                    Caption = 'Average cash payment';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
            }
        }
    }
}