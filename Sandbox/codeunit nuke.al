codeunit 50002 Nuke
{

    Subtype = Test;


    procedure NewCustomerFromTemplate(var Customer: Record Customer): Boolean

    var
        ConfigTemplateHeader: Record "Config. Template Header";
        ConfigTemplates: Page "Config Templates";
    begin
        ConfigTemplateHeader.SetRange("Table ID", DATABASE::Customer);
        ConfigTemplateHeader.SetRange(Enabled, true);

        if ConfigTemplateHeader.Count = 1 then begin
            ConfigTemplateHeader.FindFirst;
            exit(true);
        end;

        if (ConfigTemplateHeader.Count > 1) and GuiAllowed then begin
            ConfigTemplates.SetTableView(ConfigTemplateHeader);
            ConfigTemplates.LookupMode(true);
            ConfigTemplates.SetNewMode;
            if ConfigTemplates.RunModal = ACTION::LookupOK then begin
                ConfigTemplates.GetRecord(ConfigTemplateHeader);
                exit(true);
            end;
        end;

        exit(false);
    end;
}
