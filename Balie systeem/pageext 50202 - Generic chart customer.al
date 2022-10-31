pageextension 50122 "Generic chart customer" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(GenChart)
            {
                Caption = 'Generic Chart';
                Image = BarChart;
                ApplicationArea = all;
                trigger OnAction()
                var
                    X: Page "Help And Chart Wrapper";
                begin
                    X.Run();
                end;
            }
        }
    }
}