page 52050 AdditionalText
{
    PageType = Card;
    SourceTable = BalieOrderHeader;
    layout
    {
        area(Content)
        {
            group(AdditionalTextGroup)
            {
                ShowCaption = false;
                usercontrol(UserControlDesc; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = all;
                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        IsReady := true;
                        FillAddIn();
                    end;

                    trigger Callback(data: Text)
                    begin
                        //rec.AdditionalText := data;
                        rec.SetAdditionalText(data);
                    end;


                }
            }



        }
    }
    var
        IsReady: Boolean;
        tAdditionalText: text;

    trigger OnAfterGetCurrRecord()
    begin
        if IsReady then
            FillAddIn();
    end;


    local procedure FillAddIn()
    begin
        CurrPage.UserControlDesc.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif !important; font-size: 10.5pt !important;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', rec.GetAdditionalText, MaxStrLen((tAdditionalText))));
    end;

    trigger OnClosePage()
    begin
        CurrPage.SaveRecord();
    end;
}


