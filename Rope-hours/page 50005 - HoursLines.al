page 50005 "HoursLines"
{
    Caption = 'Rope hours lines';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "RopeHoursLine";
    DelayedInsert = true;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Nr; rec.Nr)
                {
                    Caption = 'Nr';
                    NotBlank = true;
                    TableRelation = "HoursHeader".Nr WHERE(Nr = FIELD(Nr));
                }
                field(Soort; rec.Soort)
                {
                    Caption = 'Soort';
                    ApplicationArea = All;
                }
                field(Maandag; rec.Maandag)
                {
                    Caption = 'Ma';
                    ApplicationArea = All;
                    Width = 3;
                }
            }
        }
    }
}
