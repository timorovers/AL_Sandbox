table 52040 "SO Import Buffer"
{
    Caption = 'SO Import Buffer';
    fields
    {
        field(1; "Batch Name"; Code[10])
        {
            Caption = 'Batch Name';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; BalieOrderNo; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Balie Order No';
        }
        field(4; Status; enum Orderstatus)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(5; "File Name"; Text[50])
        {
            Caption = 'File Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(6; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = CustomerContent;
        }
        field(7; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(8; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            Editable = false;
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(Key1; "Batch Name", "Line No.")
        {
        }
    }
}