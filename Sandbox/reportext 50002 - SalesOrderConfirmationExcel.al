reportextension 50001 TR_SalesOrderConfirmationExcel extends "Standard Sales - Order Conf."
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