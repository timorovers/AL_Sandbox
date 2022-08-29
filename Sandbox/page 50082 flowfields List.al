page 50083 "flowfields Timo"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = flowfields;
    Caption = 'FlowField Test';
    CardPageId = "flowfields card";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = all;
                    Caption = 'Customer No';
                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field(HasInvoices; rec.HasInvoices)
                {
                    ApplicationArea = all;
                    Caption = 'Has Invoices';
                }
                field(InvoicesTotal; rec.InvoicesTotal)
                {
                    ApplicationArea = all;
                    Caption = 'Invoices Total';
                }
                field(InvoiceCount; rec.InvoiceCount)
                {
                    ApplicationArea = All;
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

        // }
    }

    actions
    {
        area(Processing)
        {
            action(Actie)
            {
                ApplicationArea = All;
                Image = Calendar;

                trigger OnAction()
                begin

                end;
            }
        }
    }


    var
        myIn1t: Integer;
}