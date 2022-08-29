tableextension 50001 TimeSheetLineExt extends "Time Sheet Line"
{
    fields
    {
        field(50001; Factureerbaar; boolean)
        {
            Caption = 'Klant moet betalen';
        }
        field(50005; Werksoort; Option)
        {
            OptionMembers = "Intern","Consultancy","Service","Project","Afwezigheid";
            Caption = 'Werksoort';
        }
        field(50010; Customer; Code[50])
        {
            TableRelation = Customer;
            Caption = 'Klant';
            ValidateTableRelation = true;
        }
    }
    var
        myInt: Integer;

    procedure ConsultancyPay()

    var
        Werksoort: Option;


    begin
        case Werksoort of
            rec.Werksoort::Consultancy:
                rec.Factureerbaar := true;



        end;

    end;
}