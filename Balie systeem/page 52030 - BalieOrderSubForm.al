page 52030 "Balie Order SubForm"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    //  DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = BalieOrderLine;


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
                    ApplicationArea = Basic, Suite;
                }

                field("Line number"; rec."Line number")
                {
                    Caption = 'Line number';
                    ApplicationArea = All;
                }
                field(ItemNo; rec.ItemNo)
                {
                    Caption = 'No';
                    ApplicationArea = All;
                    TableRelation = Item;
                }

                field(Description; rec.Description)
                {
                    Caption = 'Description';
                    TableRelation = Item;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }

                field(Quantity; rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }

                field("Discount %"; rec."Discount %")
                {
                    Caption = 'Discount %';
                    ApplicationArea = All;
                    DecimalPlaces = 0 : 3;
                }

                field(Price; rec.Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
            }
        }
    }
}
