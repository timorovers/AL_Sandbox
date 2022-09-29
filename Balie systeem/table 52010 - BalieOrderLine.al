table 52010 "BalieOrderLine"
{
    Caption = 'Balie order line';
    DrillDownPageID = "BalieOrderLines";
    LookupPageID = "BalieOrderLines";
    fields
    {
        field(1; BalieOrderNummer; code[20])
        {
            Caption = 'Balie ordernummer';
            NotBlank = false;
            //TableRelation = "BalieOrderHeader".Balieordernummer WHERE(Balieordernummer = FIELD(BalieOrderNummer));
            TableRelation = BalieOrderHeader.Balieordernummer;
        }
        field(2; "Line number"; Integer)
        {
            Caption = 'Line number';
            //AutoIncrement = true;
            Editable = true;
            NotBlank = false;

        }
        field(5; "PaymentMethod"; enum PaymentMethod)
        {
            Caption = 'Betaalmethode';
        }
        field(10; "ItemNo"; code[50])
        {
            Caption = 'ItemNo';
            TableRelation = Item;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if rec.ItemNo <> xRec.ItemNo then begin
                    if Item.get("ItemNo") then begin
                        "Description" := Item.Description;
                        "Price" := item."Unit Price";
                    end;
                end;
            end;
        }
        field(15; "Description"; text[35])
        {
            Caption = 'Description';
            NotBlank = true;
            TableRelation = Item;
        }
        field(25; "Quantity"; integer)
        {
            Caption = 'Quantity';
        }
        field(30; "Discount %"; Decimal)
        {
            TableRelation = item;
            Caption = 'Discount %';
        }
        field(35; "Price"; Decimal)
        {
            TableRelation = item."Unit Price";
            Caption = 'Price';
        }
        field(40; "Line Amount"; Decimal)
        {
        }

    }
    keys
    {
        key(pk; BalieOrderNummer, "Line number")
        {

        }
    }
}
