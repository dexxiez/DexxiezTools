
local frame, events = CreateFrame("Frame"), {};


function events:PLAYER_ENTERING_WORLD()
    SetCVar("cameraDistanceMaxZoomFactor", "4");
end

function events:UNIT_SPELLCAST_SENT(self, target, arg1, spell)
    local inInstance = IsInInstance();
    if(not inInstance) then return end;

    local taunts = {
        "Having a word with %s",
        "Insulting %s",
        "Giving a written warning to %s"
    }

    -- Hand of Reckoning or Distracting Shot
    if(spell == 62124 or spell == 20736) then
        SendChatMessage(string.format(taunts[math.random(1, table.getn(taunts))], DxUtils:FixName(target)), "SAY");
        return;
    end
    
    -- Shield of Rightnesseness
    if(spell == 48827) then
        if(not UnitAffectingCombat("player")) then
            SendChatMessage("READY CHECK!", "YELL");
            return;
        end
    end

    -- Div Prot + Div Sac
    if(spell == 498 or spell == 64205) then
        local spellName = GetSpellInfo( spell );
        local englishSelfReference = (function () if (spell == 64205) then return "WE'RE" else return "I'M" end end)();
        WhisperTanksHealers(string.format("{star} %s is now active {star} - %s FUCKED", spellName, englishSelfReference));
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    events[event](self, ...);
   end);
   for k, v in pairs(events) do
        frame:RegisterEvent(k);
end