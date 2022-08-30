reportextension 50101 MyExtContactList extends "Contact - List"
{
    rendering
    {
        layout(LayoutExcel)
        {
            Type = Excel;
            LayoutFile = 'MyExcelContactList.xlsx';
        }
    }
}