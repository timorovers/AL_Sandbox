query 50000 MyQuery
{
    QueryType = API;
    APIPublisher = 'Timozkovic';
    APIGroup = 'GroupName';
    //APIVersion = 'VersionList';
    EntityName = 'EntityName';
    EntitySetName = 'EntitySetName';
    Caption = 'MyQueryTimo';
    QueryCategory = 'Customer List';

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
            column(status; Status)
            {
            }
            column(yourReference; "Your Reference")
            {
            }
            column(comment; Comment)
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