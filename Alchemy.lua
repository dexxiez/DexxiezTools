Alchemy = {}

local freePots = 0;
local procs = 0;

function Alchemy:HandleCommand(args)
    if args == "count" then
        print("Free Pots: " .. freePots .. " - Procs: " .. procs);
    elseif args == "report" then
        if UnitInParty("player") then
            SendChatMessage("Thanks for using Dr Dexxiez Alchemy - MBBS, FRANZCP, MD (Psychiatry)" .. procs ,"PARTY");
            SendChatMessage("[Session Stats] Free Pots: " .. freePots .. " - Procs: " .. procs ,"PARTY");
        else
            SendChatMessage("Thanks for using Dr Dexxiez Alchemy - MBBS, FRANZCP, MD (Psychiatry)" .. procs ,"GUILD");
            SendChatMessage("[Session Stats] Free Pots: " .. freePots .. " - Procs: " .. procs ,"GUILD");
        end
    elseif args == "reset" then
        freePots = 0;
        procs = 0;
        print("Reset");
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", function(frame, event, msg)
	_, _, key, value = msg:find('You create.+%[(.+)%].+(%d+)');
    if key == "Potion of Speed" or key == "Potion of Wild Magic" or key == "Indestructible Potion" then
            if value == "0" then return false end
            freePots = freePots + tonumber(value) - 1;
            procs = procs + 1;
            print("|c00FF5E13" .. key .. " had a " .. value .. " proc!|r");

            if UnitInParty("player") then
                if value == "4" or value == "5" then
                    SendChatMessage("FUCK ME CUNT! " .. key .. " had a " .. value .. " proc!" ,"PARTY");
                else
                    SendChatMessage("Good News! " .. key .. " had a " .. value .. " proc!" ,"PARTY");
                end
            else 
                if value == "4" or value == "5" then
                    SendChatMessage("FUCK ME CUNT! " .. key .. " had a " .. value .. " proc!" ,"GUILD");
                else
                    SendChatMessage("Good News! " .. key .. " had a " .. value .. " proc!" ,"GUILD");
                end
            end
    end
    return false;
end)