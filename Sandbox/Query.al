query 50000 MyQuery
{
    QueryType = Normal;
    Caption = 'QueryTimo';



    elements
    {
        dataitem(SH; "Sales Header")
        {
            column(no; "No.")
            {
            }
            column(sellToCustomerName; "Sell-to Customer Name")
            {
            }
            column(amount; Amount)
            {
            }
            column(billToCity; "Bill-to City")
            {
            }
            dataitem(SL; "Sales Line")
            {
                DataItemLink = "Document Type" = SH."Document Type", "Document No." = SH."No.";
                column(Type; Type)
                {
                }
                column(ItemNo; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(Quantity; Quantity)
                {
                }
            }
        }
    }
}