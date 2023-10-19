table 52030 BalieOrderCueTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[250])
        {

            DataClassification = ToBeClassified;
        }
        field(2; BalieOrdersVrijgegeven; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Released)));
        }
        field(3; BalieOrdersOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Open)));
        }
        field(4; BalieOrdersGearchiveerd; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Archived)));
        }
        field(5; BalieOrdersCancelled; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = filter(Cancelled)));
        }
        field(6; TotaalBalieOrders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader);
        }
        field(7; AverageCashPayment; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average(BalieOrderLine."Line Amount" where(PaymentMethod = filter(Cash)));
        }
    }


    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
