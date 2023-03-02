codeunit 50000 TREmailHandler
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Mail Management", 'OnSendViaEmailModuleOnAfterCreateMessage', '', false, false)]
    local procedure OnSendViaEmailModuleOnAfterCreateMessage(var Message: Codeunit "Email Message"; var TempEmailItem: Record "Email Item");
    begin
        Message.SetSubject(TempEmailItem.Subject + ' From ' + UserId + 'greetings Timo :)');
    end;
}