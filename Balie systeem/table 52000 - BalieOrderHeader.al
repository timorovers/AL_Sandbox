table 52005 BalieOrderHeader
{
    Caption = 'BalieOrderHeader';
    LookupPageID = "BalieOrderlist";
    Extensible = true;
    DataCaptionFields = "Balieordernummer", "Bill-to Name";


    fields
    {
        field(1; "Balieordernummer"; Code[20])
        {
            Caption = 'Balie ordernummer';
            NotBlank = true;
        }
        field(5; "Betaalmethode"; Enum Betaalmethode)
        {
            Caption = 'Betaalmethode';
        }
        field(10; "OrderStatus"; enum Orderstatus)
        {
            Caption = 'Orderstatus';
        }
        field(15; "Notitie"; Text[100])
        {
            Caption = 'Notitie';
        }







        field(20; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            NotBlank = true;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if rec."Bill-to Customer No." <> xRec."Bill-to Customer No." then begin
                    if Customer.get("Bill-to Customer No.") then begin
                        "Bill-to Name" := Customer.Name;
                        "Bill-to Address" := Customer.Address;
                    end;
                end;
            end;
        }
        field(25; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if rec."Bill-to Customer No." <> xRec."Bill-to Customer No." then begin
                    if Customer.get("Bill-to Customer No.") then begin
                        "Bill-to Name" := Customer.Name;
                        "Bill-to Address" := Customer.Address;
                    end;
                end;
            end;
        }
        field(30; "Bill-to Address"; Text[100])
        {
            Caption = 'Bill-to Address';
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if rec."Bill-to Customer No." <> xRec."Bill-to Customer No." then begin
                    if Customer.get("Bill-to Customer No.") then begin
                        "Bill-to Name" := Customer.Name;
                        "Bill-to Address" := Customer.Address;
                    end;
                end;
            end;
        }
        field(35; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(40; "No. Series"; code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }

    }
    keys
    {
        key(Balieordernummer; Balieordernummer)
        {
            Clustered = true;
        }
    }

    var
        myInteger: Integer;

    trigger OnInsert()
    begin
        InitInsert;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        case OrderStatus of
            OrderStatus::Open:
                StatusStyleText := 'Favorable';

            OrderStatus::Vrijgegeven:
                StatusStyleText := 'Strong';

            OrderStatus::Gearchiveerd:
                StatusStyleText := 'Ambiguous';

        end;

    end;

    procedure InitInsert()
    var
        IsHandled: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IsHandled := false;

        if not IsHandled then
            if Balieordernummer = '' then begin
                //  TestNoSeries;
                NoSeriesMgt.InitSeries('BALIEORDERS', xRec."No. Series", "Posting Date", Balieordernummer, "No. Series");
            end;


    end;

    local procedure OnAfterGetStatusStyleText(BalieOrderHeader: Record "BalieOrderHeader"; var StatusStyleText: Text)
    begin
    end;

    local procedure OnAfterGetStatusStyleText(SalesHeader: Record "Sales Header"; var StatusStyleText: Text)
    begin
    end;

}







