page 50020 "BalieOrderLines"
{
    Caption = 'Balie order lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "BalieOrderLine";
    DelayedInsert = true;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(BalieOrderNummer; rec.BalieOrderNummer)
                {
                    Caption = 'Balie ordernummer';
                    TableRelation = "BalieOrderHeader".Balieordernummer WHERE(Balieordernummer = FIELD(BalieOrderNummer));
                }
                field("PaymentMethod"; rec."PaymentMethod")
                {
                    Caption = 'Document Type';
                    ApplicationArea = All;
                }
            }
        }
    }
}
