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
                    Caption = 'Vrijgegeven';
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
                    Caption = 'Gearchiveerd';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
                field(TotaalBalieOrders; rec.TotaalBalieOrders)
                {
                    Caption = 'Alle balie orders';
                    DrillDownPageId = BalieOrderList;
                    ApplicationArea = All;
                }
            }
        }
    }
}