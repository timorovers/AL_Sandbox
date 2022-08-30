reportextension 50101 MyExtContactList extends "Contact - List"
{
    rendering
    {
        layout(LayoutExcel)
        {
            Caption = 'Testing Excel';
            Type = Excel;
            LayoutFile = 'MyExcelContactList.xlsx';
        }
    }
}