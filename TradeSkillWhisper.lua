local function tradeSkillWhisperEventHandler(self, event, msg, sender)
    if event == "CHAT_MSG_WHISPER" then
        local count = GetNumCrafts()
        if count > 0 then
            for i=1, count do
                local name, _, type, _, _ = GetCraftInfo(i);
                print(name, type)
                if (name and type ~= "header") then
                    DEFAULT_CHAT_FRAME:AddMessage("Found: "..name);
                end
            end
        else
            print("You must open enchanting window")
            return 0
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", tradeSkillWhisperEventHandler)
