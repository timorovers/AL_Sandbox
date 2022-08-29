pageextension 50001 TimeSheetSubfromext extends "Time Sheet Lines Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Cause of Absence Code")
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = false;
        }
        // modify(Field6)
        // {
        //     Visible = false;
        // }
        // modify(Field7)
        // {
        //     Visible = false;
        // }
        modify(UnitOfMeasureCode)
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = false;
        }
        addafter(Description)
        {
            field(Factureerbaar; rec.Factureerbaar)
            {
                Caption = 'Klant moet betalen';
                ApplicationArea = all;
            }
            // addafter(Description)
            // {
            //     field()
            // }

        }
        addbefore(Status)
        {
            field(Werksoort; rec.Werksoort)
            {
                ApplicationArea = all;
                Caption = 'Werksoort';
            }
        }
        addafter(Werksoort)
        {
            field(Customer; rec.Customer)
            {
                ApplicationArea = All;
                Caption = 'Klant';
            }
        }
    }
    procedure GetWerksoortColor() StatusStyleText: Text
    begin
        case rec.Werksoort of
            rec.Werksoort::Project:
                StatusStyleText := 'Favorable';

            rec.Werksoort::Afwezigheid:
                StatusStyleText := 'Unfavorable';
        end;
        Commit();
        CurrPage.Update();

    end;

    // procedure ConsultancyPay()

    // var
    //     Werksoort: Option;


    // begin
    //     case Werksoort of
    //         rec.Werksoort::Consultancy:
    //             rec.Factureerbaar := true;


    //     end;
    //     // if Werksoort then rec.Chargeable := true
    //     // else 
    //     // rec.Chargeable := editable;
    // end;
}