report 50000 BalieOrderReport
{
    DefaultLayout = Word;
    WordLayout = 'BalieOrderReport.docx';
    //  RDLCLayout = './StandardSalesInvoice.rdlc';
    PreviewMode = PrintLayout;
    WordMergeDataItem = BalieOrderHeader;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Extensible = true;

    dataset
    {
        dataitem(BalieOrderHeader; BalieOrderHeader)
        {
            // DataItemTableView = SORTING(Balieordernummer);
            // RequestFilterFields = "Balieordernummer";
            RequestFilterHeading = 'Balie order';
            column(Balieordernummer; Balieordernummer)
            { }
            column(Betaalmethode; Betaalmethode)
            { }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            { }
            column(Bill_to_Name; "Bill-to Name")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Notitie; "Notitie")
            { }
            dataitem(Line; BalieOrderLine)
            {
                DataItemLink = balieordernummer = FIELD(Balieordernummer);
                DataItemLinkReference = BalieOrderHeader;
                column(LineNo_Line; "Line number")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Discount; "Discount %")
                {
                }
                column(Price; Price)
                {
                }
            }
            dataitem(AdditionalText; BalieOrderHeader)
            {
                DataItemLink = Balieordernummer = field(Balieordernummer);
                DataItemLinkReference = BalieOrderHeader;
                column(Additional_Text; AdditionalText)
                {
                }
            }
        }

    }
    var
        Balieordernummer: integer;
        Betaalmethode: enum PaymentMethod;

}