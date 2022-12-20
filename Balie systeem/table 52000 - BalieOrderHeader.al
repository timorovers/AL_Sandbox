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
            //NotBlank = true;

            trigger OnValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "Balieordernummer" <> xRec."Balieordernummer" then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."BalieOrderNoS");
                    "No. Series" := '';
                end;
            end;
        }
        field(5; "PaymentMethod"; Enum PaymentMethod)
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
        field(20; AdditionalText; blob)
        {
            DataClassification = ToBeClassified;
        }








        field(25; "Bill-to Customer No."; Code[20])
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
        field(30; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            Editable = false;
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
        field(35; "Bill-to Address"; Text[100])
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
        field(40; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(45; "No. Series"; code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50; AantalBalieOders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader);
        }
        field(55; ShipmentCostsIncluded; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipment Costs Included';
        }
        field(60; InputText; text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type here';
        }

    }
    keys
    {
        key(Balieordernummer; Balieordernummer)
        {
            Clustered = true;
        }
    }

    procedure SetAdditionalText(NewAdditionalText: Text)
    var
        OutStream: OutStream;
    begin
        Clear(AdditionalText);
        "AdditionalText".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewAdditionalText);
        Modify;
    end;



    procedure GetAdditionalText() outText: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields(AdditionalText);
        "AdditionalText".CreateInStream(InStream, TEXTENCODING::UTF8);
        if not TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), OutText) then
            Message(ReadingDataSkippedMsg, FieldCaption("AdditionalText"));
    end;




    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Balieordernummer = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(BalieOrderNoS);
            NoSeriesMgt.InitSeries(SalesSetup.BalieOrderNoS, xRec."No. Series", 0D, Balieordernummer, "No. Series");
        end;
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

            OrderStatus::Released:
                StatusStyleText := 'Strong';

            OrderStatus::Archived:
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

    var
        myInteger: Integer;
        ReadingDataSkippedMsg: Label 'Loading field %1 will be skipped because there was an error when reading the data.\To fix the current data, contact your administrator.\Alternatively, you can overwrite the current data by entering data in the field.', Comment = '%1=field caption';
}








