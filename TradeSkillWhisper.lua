local function tradeSkillWhisperEventHandler(self, event, msg, sender)
    print(event, sender, msg)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", tradeSkillWhisperEventHandler)
