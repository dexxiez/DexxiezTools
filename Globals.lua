function WhisperTanksHealers(msg)
    local myName = UnitName("player");
    if(UnitInRaid("player")) then
        local players = DxUtils:GetPartyMembers();
        for i=1,40 do
            local role = UnitGroupRolesAssigned(string.format("raid%i", i));
            if(role == "HEALER" or role == "TANK") then
                if(players[i] ~= myName) then
                    SendChatMessage(msg, "WHISPER", nil, players[i]);
                end
            end
        end
    elseif(UnitInParty("player")) then
        local players = DxUtils:GetPartyMembers();
        for i=1,4 do
            local role = UnitGroupRolesAssigned(string.format("party%i", i));
            if(role == "HEALER" or role == "TANK") then
                if(players[i] ~= myName) then
                    SendChatMessage(msg, "WHISPER", nil, players[i]);
                end
            end
        end
    end
end