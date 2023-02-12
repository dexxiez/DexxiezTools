

-- function WhisperHealPet()
--     if(UnitInParty("player") or UnitInRaid("player")) then
--         local message = "Please heal Jaz, she will be sad (".. math.floor(UnitHealth("pet") / UnitHealthMax("pet") * 100) .. "% Left)";
--         for k, v in pairs(getMembers()) do
--             if(v == "Brizandi") then
--                 SendChatMessage(message, "WHISPER", nil, "Brizandi");
--             end
--           end
--     end
-- end