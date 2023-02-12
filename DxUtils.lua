DxUtils = {};

function DxUtils:FixName(name) 
    local tblNames = {
        ["Hodir"] = "Hodin",
        ["Hodir Image"] = "Hodin Image",
        ["Champion of Hodir"] = "Champion of Hodin"
    }

    if(tblNames[name]) then
        return tblNames[name];
    else
        return name;
    end
end

function DxUtils:GetPartyMembers()
    local plist={}
    if IsInRaid() then
        for i=1,40 do
            if (UnitName('raid'..i)) then
                tinsert(plist,(UnitName('raid'..i)))
            end
        end
    elseif IsInGroup() then
        for i=1,4 do
            if (UnitName('party'..i)) then
                tinsert(plist,(UnitName('party'..i)))
            end
        end
    end
    return plist
end