pageextension 50020 RoleCenterExtension extends "Business Manager Role Center"
{
    layout
    {
        // Add changes to page layout here
        addfirst(rolecenter)
        {
            part(BalieCue; BalieCue)
            {
                ApplicationArea = all;
                Caption = 'Balie order data';
            }
        }
    }
}
