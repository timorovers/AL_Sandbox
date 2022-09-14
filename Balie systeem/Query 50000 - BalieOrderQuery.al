query 50000 BalieOrderQuery
{
    Caption = 'BalieQuery';
    QueryType = Normal;

    elements
    {
        dataitem(BalieOrderHeader; BalieOrderHeader)
        {
            column(AantalBalieOders; AantalBalieOders)
            {
            }
            column(Balieordernummer; Balieordernummer)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(OrderStatus; OrderStatus)
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
        }
    }


    trigger OnBeforeOpen()
    begin

    end;
}
