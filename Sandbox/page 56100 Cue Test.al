Page 56100 "Cue Test"

{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'Bob de Bouwer tegels';

    layout
    {
        area(Content)
        {
            cuegroup(G1)
            {
                Caption = 'Een paar tegels';

                field(Number; Number)
                {
                    Caption = 'Tegel Timo';
                    ApplicationArea = all;
                    StyleExpr = 'Favorable';
                    trigger OnDrillDown()
                    begin
                        Message('Timo de tegelbouwer!');
                    end;
                }
                field(Balance; rec.Balance)
                {
                    //StyleExpr = 'Unfavorable';
                    ApplicationArea = all;
                }
                field("Balance Due"; rec."Balance Due")
                {
                    // StyleExpr = 'Favorable';
                    ApplicationArea = all;
                }
            }
            cuegroup(G2)
            {
                Caption = 'Nog meer tegels';
                field("Sales (LCY)"; rec."Sales (LCY)")
                {
                    Caption = 'Sales';
                    ApplicationArea = all;
                    StyleExpr = 'Favorable';
                }
            }
            cuegroup(G3)
            {
                Caption = 'De laatste tegels';
                field("Credit Amount"; rec."Credit Amount")
                {
                    ApplicationArea = all;
                    Caption = 'Credit Amount';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

    end;

    var
        Number: Integer;
}