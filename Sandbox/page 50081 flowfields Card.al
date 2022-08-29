page 50081 "flowfields Card"
{
    PageType = Card;
    SourceTable = flowfields;
    Caption = 'Flowfields Timo';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = all;
                    Caption = 'Customer no';
                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = all;
                    Caption = 'Customer Name';
                }
                field(HasInvoices; rec.HasInvoices)
                {
                    ApplicationArea = All;
                    Caption = 'Has invoices';
                }
                field(InvoicesTotal; rec.InvoicesTotal)
                {
                    ApplicationArea = All;
                    Caption = 'Invoices sum';
                }
                field(InvoiceCount; rec.InvoiceCount)
                {
                    ApplicationArea = all;
                    Caption = 'Invoice Count';
                }
                field(AverageInvoice; rec.AverageInvoice)
                {
                    ApplicationArea = All;
                    Caption = 'Average Invoice Amount';
                }
                field(MaxInvoiceAmount; rec.MaxInvoiceAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Max Invoice Amount';
                }
            }

        }
        // area(FactBoxes)
        // {
        //     part(Control149; "Item Picture")
        //     {
        //         ApplicationArea = Basic, Suite;
        //         SubPageLink = "No." = FIELD("No");
        //         Visible = true;
        //     }

    }

    // trigger OnAfterGetRecord()
    // var 
    // ItemRec: record Item;
    // begin
    //     ItemRec.Reset();
    //     if Page.RunModal(Page::"Item Card", ItemRec) = Action::LookupOK then 


    // end;
    // }

    actions
    {
        area(Processing)
        {
            action(Actie)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }


    var
        myIn1t: Integer;
}