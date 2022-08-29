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
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Vrijgegeven)));

        }
        field(3; BalieOrdersOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Open)));
        }
        field(4; BalieOrdersGearchiveerd; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader where(OrderStatus = FILTER(Gearchiveerd)));
        }

        field(5; TotaalBalieOrders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(BalieOrderHeader);
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