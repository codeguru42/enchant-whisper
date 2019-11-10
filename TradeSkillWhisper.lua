local function showRecipeLinks(recipient, ...)
    local term = ...
    local count = GetNumCrafts()
    if count > 0 then
        local found = 0
        for i=1, count do
            local name, _, _, _, _, _, _ = GetCraftInfo(i)
            local link = GetCraftItemLink(i);
            if term then
                name = string.lower(name)
                term = string.lower(term)
                if string.find(name, term) then
                    SendChatMessage(link, "WHISPER", nil, recipient)
                    found = found + 1
                end
            else
                SendChatMessage(link, "WHISPER", nil, recipient)
                found = found + 1
            end
        end
        if found == 0 then
            error = string.join(' ', "No matches found for", term)
            SendChatMessage(error, "WHISPER", nil, recipient)
        end
    else
        print("You must open enchanting window")
        return 0
    end
end

local function tradeSkillWhisperEventHandler(self, event, msg, sender)
    if event == "CHAT_MSG_WHISPER" then
        local cmd, term = string.split(' ', msg)
        if cmd == "!list" then
            showRecipeLinks(sender)
        elseif cmd == "!search" then
            showRecipeLinks(sender, term)
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", tradeSkillWhisperEventHandler)
