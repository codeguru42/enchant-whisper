local function showRecipeLinks(recipient)
    local count = GetNumCrafts()
    if count > 0 then
        for i=1, count do
            local link = GetCraftItemLink(i);
            SendChatMessage(link, "WHISPER", nil, recipient)
        end
    else
        print("You must open enchanting window")
        return 0
    end
end

local function tradeSkillWhisperEventHandler(self, event, msg, sender)
    if event == "CHAT_MSG_WHISPER" then
        if msg == "!list" then
            showRecipeLinks(sender)
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", tradeSkillWhisperEventHandler)
