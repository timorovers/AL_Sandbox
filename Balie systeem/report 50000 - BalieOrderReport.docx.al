report 50000 BalieOrderReport
{
    DefaultLayout = Word;
    WordLayout = 'Layouts./BalieOrderReport.docx';
    rdlcLayout = './Layouts./BalieOrderReport.rdl';
    PreviewMode = PrintLayout;
    WordMergeDataItem = BalieOrderHeader;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(BalieOrderHeader; BalieOrderHeader)
        {
            DataItemTableView = SORTING(Balieordernummer);
            RequestFilterFields = "Balieordernummer", "Bill-to Customer No.";
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
                DataItemTableView = SORTING(BalieOrderNummer, "Line number");

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
                column(Line_Amount; "Line Amount")
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