table 50005 BalieOrderSettings
{
    Caption = 'BalieOrderSettings';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "BalieOrderNoS"; code[20])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; BalieOrderNoS)
        {
            Clustered = true;
            Enabled = true; //TEST|TRO|Tags
        }
    }
}
