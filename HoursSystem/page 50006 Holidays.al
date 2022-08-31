page 50006 Holidays
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Holidays;
    Caption = 'Holidays';

    layout
    {
        area(Content)
        {
            group(Vakantiegegevens)
            {
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Naam';
                }
                field(DaysTotal; rec.DaysTotal)
                {
                    ApplicationArea = All;
                    Caption = 'Dagen in totaal';
                }
                field(DaysTaken; rec.DaysTaken)
                {
                    ApplicationArea = All;
                    Caption = 'Dagen opgenomen';
                }
                field(DaysRemaining; rec.DaysRemaining)
                {
                    ApplicationArea = All;
                    Caption = 'Dagen over';
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = All;
                    Caption = 'Remarks';
                    Width = 30;
                    Style = Attention;
                }
            }
        }
    }
}


