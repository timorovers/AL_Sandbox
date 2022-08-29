tableextension 50000 Item extends Item
{
    fields
    {
        field(50000; "Last counted"; Boolean)
        { }
        field(50001; "Aanvulling per boot?"; Boolean)
        { }
        field(50002; "ItemColor"; Enum ItemColor)
        { }
    }

    var
        myInt: Integer;
}
