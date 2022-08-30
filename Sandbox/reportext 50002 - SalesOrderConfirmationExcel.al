reportextension 50002 TR_SalesOrderConfirmationEXcel extends "Standard Sales - Order Conf."
{
    rendering
    {
        layout(LayoutExcel)
        {
            Caption = 'TR_SalesOrderConfirmationExcel';
            Type = Excel;
            LayoutFile = 'TR_SalesOrderConfirmationExcel.xlsx';
        }
    }
}