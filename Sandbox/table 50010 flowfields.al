table 50010 flowfields
{
    DataClassification = ToBeClassified;
    Extensible = true;


    fields
    {
        field(1; CustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'CustomerNo';
            TableRelation = Customer."No.";
        }
        field(5; CustomerName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field(CustomerNo)));
        }
        field(10; HasInvoices; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Invoice Header" where("Sell-to Customer No." = field(CustomerNo)));
        }
        field(15; InvoicesTotal; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field(CustomerNo)));
        }
        field(20; InvoiceCount; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Document Type" = const(Invoice), "Customer No." = field(CustomerNo)));
        }
        field(25; AverageInvoice; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field(CustomerNo)));
        }
        field(30; MaxInvoiceAmount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field(CustomerNo)));
        }
    }

    keys
    {
        key(PK; CustomerNo)
        {
            Clustered = true;
        }
    }

    var
        myInteger: Integer;

    trigger OnInsert()
    begin

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

}