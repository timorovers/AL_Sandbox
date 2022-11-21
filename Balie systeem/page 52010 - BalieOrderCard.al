page 52000 BalieorderCard
{
    Caption = 'BalieOrder';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';
    RefreshOnActivate = true;
    SourceTable = BalieOrderHeader;
    Editable = true;
    AutoSplitKey = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Algemeen';
                field(Balieordernummer; rec.Balieordernummer)
                {
                    Caption = 'Balie order nr';
                    ApplicationArea = All;
                    TableRelation = "BalieOrderHeader".Balieordernummer WHERE(Balieordernummer = FIELD(BalieOrderNummer));
                    trigger OnValidate()
                    begin
                        if rec.Balieordernummer <> xrec.Balieordernummer then
                            rec."Posting Date" := Today;
                    end;


                }
                field(PaymentMethod; rec.PaymentMethod)
                {
                    Caption = 'Betaalmethode';
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ApplicationArea = All;
                    TableRelation = Customer;
                }

                field("Bill-to Name"; rec."Bill-to Name")
                {
                    Caption = 'Klantnaam';
                    ApplicationArea = All;
                    Editable = false;
                }


                field("Bill-to Address"; rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address';
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    Caption = 'Boekingsdatum';
                    ApplicationArea = All;
                }
                field(OrderStatus; rec.OrderStatus)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }
                field(Notitie; rec.Notitie)
                {
                    Caption = 'Note';
                    ApplicationArea = All;
                }
                field(ShipmentCostsIncluded; rec.ShipmentCostsIncluded)
                {
                    ApplicationArea = all;
                    Caption = 'Shipment Costs Included';
                }
            }
            part(BalieOrderLines; "Balie Order SubForm")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                SubPageLink = BalieOrderNummer = field(Balieordernummer);
                Caption = 'Lines';

            }
        }
    }
    actions
    {
        area(Processing)
        {

            action("Test Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Preview';
                Ellipsis = true;
                Image = TestReport;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';
                trigger OnAction()
                var
                    BalieOrderReport: Report BalieOrderReport;
                begin
                    BalieOrderReport.SetTableView(rec);
                    BalieOrderReport.RunModal();
                end;
            }
            action("Post")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post';
                Ellipsis = true;
                Image = Post;

                trigger OnAction()
                var

                begin
                    PostBalieOrder();
                end;
            }
            action(AdditionalText)
            {
                ApplicationArea = all;
                Caption = 'Additional text';
                RunObject = page AdditionalText;
                image = EditAdjustments;
                trigger OnAction();
                var
                    lRecContracts: Record BalieOrderHeader;
                    EditorPage: page AdditionalText;

                begin
                    lRecContracts.SetRange(Balieordernummer, rec.Balieordernummer);
                    EditorPage.SetTableView(lRecContracts);
                    EditorPage.run;


                end;

            }
            action(Nuke)
            {
                ApplicationArea = all;
                Caption = '☢️ Nuke';
                trigger OnAction()
                begin
                    PostBalieOrder();
                end;
            }
        }
    }
    local procedure PostBalieOrder()
    var
        SalesHeader: Record "Sales Header";
        so: page "Sales Order";
    begin
        rec.TestField("Bill-to Customer No.");
        SalesHeader.InitInsert();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := '';
        SalesHeader.Insert(true);
        SalesHeader.Validate("Sell-to Customer No.", rec."Bill-to Customer No.");
        SalesHeader."External Document No." := rec.Balieordernummer;
        SalesHeader.Modify();
        Message('1 Verkooporder %1 gemaakt %2', SalesHeader."No.", 'goed hè?');
    end;
}


