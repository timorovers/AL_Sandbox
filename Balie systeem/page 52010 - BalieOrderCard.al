page 52000 BalieorderCard
{
    Caption = 'BalieOrder';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';
    RefreshOnActivate = true;
    SourceTable = BalieOrderHeader;
    Editable = true;
    AutoSplitKey = false;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Algemeen';
                field(Balieordernummer; rec.Balieordernummer)
                {
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
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    TableRelation = Customer;
                }

                field("Bill-to Name"; rec."Bill-to Name")
                {
                    Editable = false;
                }
                field("Bill-to Address"; rec."Bill-to Address")
                {
                }
                field("Posting Date"; rec."Posting Date")
                {
                }
                field(Shipmentdate; rec.Shipmentdate)
                {
                }
                field(OrderStatus; rec.OrderStatus)
                {
                }
                field(Notitie; rec.Notitie)
                {
                }
                field(ShipmentCostsIncluded; rec.ShipmentCostsIncluded)
                {
                }
                field(Boolean1; rec.Boolean1)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        if rec.Boolean1 = true then
                            rec.Boolean2 := true;
                        rec.Boolean3 := true;

                    end;
                }
                field(Boolean2; rec.Boolean2)
                {
                    ApplicationArea = all;
                }
                field(Boolean3; rec.Boolean3)
                {
                    ApplicationArea = all;
                }
            }
            part(BalieOrderLines; "Balie Order SubForm")
            {
                Editable = true;
                SubPageLink = BalieOrderNummer = field(Balieordernummer);
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
                    Balieline: record BalieOrderLine;
                    BalieHeader: record BalieOrderHeader;
                begin
                    BalieHeader.Get(rec.BalieOrderNummer);
                    Balieline.SetRange(BalieOrderNummer, BalieHeader.Balieordernummer);
                    BalieOrderReport.SetTableView(Balieline);
                    BalieOrderReport.RunModal();
                    rec.SetCurrentKey(Balieordernummer);
                    Commit();
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
                Caption = 'Nuke';
                Image = Post;
                trigger OnAction()
                begin
                    CurrPage.Close();
                    Message('Page closed haha');
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


