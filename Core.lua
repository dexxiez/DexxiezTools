local function DxAddonCommands(msg, editbox)
    -- pattern matching that skips leading whitespace and whitespace between cmd and args
    -- any whitespace at end of args is retained
    local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
     
    if cmd == "alch" and args ~= "" then
        Alchemy:HandleCommand(args);
        
    -- elseif cmd == "remove" and args ~= "" then
    --   print("removing " .. args)
    --   -- Handle removing of the contents of rest... to something.   
    else
      -- If not handled above, display some sort of help message
      print("Invalid Syntax");
    end
  end
  
  SLASH_DXTOOLS1 = '/dx';
  
  SlashCmdList["DXTOOLS"] = DxAddonCommands;
