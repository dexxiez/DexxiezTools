local f = CreateFrame("Frame")
f:RegisterUnitEvent("UNIT_HEALTH", "pet")
f:SetScript("OnEvent", function()
  if not UnitExists("pet") or UnitHealth("pet") == 0 then
    local inInstance = IsInInstance();
    if(not inInstance) then return end;
    SendChatMessage("MY DOG IS FUCKING DEAD. THANKS GUYS", "YELL");
  end
end)