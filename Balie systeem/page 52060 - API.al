page 52060 TROAPI
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'TRO API';
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Weather; GetWeather)
                {
                    ApplicationArea = All;
                    Caption = 'Weer in Venlo';
                }
            }
        }
    }
    procedure GetWeather(): Text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        J: JsonObject;
        ResponseTxT: Text;
    begin
        if Client.get('http://weerlive.nl/api/json-data-10min.php?key=91e8be5f96&locatie=Venlo', Response) then
            //Je API-key is: 91e8be5f96
            if Response.IsSuccessStatusCode() then begin
                Response.Content().ReadAs(ResponseTxT);
                J.ReadFrom(ResponseTxT);
                exit(GetJsonTextField(J, 'temp'));
            end;

    end;

    procedure GetJsonTextField(O: JsonObject; Member: Text): Text
    var
        Result: JsonToken;
    begin
        if O.Get(Member, Result) then
            exit(Result.AsValue().AsText());
    end;
}