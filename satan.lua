-- GentaHax Custom API For Creative Ps
hax = {}
hax.owner = "`4[ S  x  T  x  N ]`` "
hax.hook = AddHook

function log(str) 
  logToConsole(hax.owner.. str) 
end

function overText(str)
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = str, 
    }
  ) 
end

function drop(a, b) 
  sendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|"..a.."|\nitem_count|"..b.."\n\n")
end

function wear(x) 
  sendPacketRaw(false, 
    {
      type = 10,
      value = x, 
    }
  ) 
end


hax.hook("OnTextPacket", "CommandList",function(type, str) 
    if str:find("/dw (%d+)") then
      local amt = str:match("/dw (%d+)") 
      wear(1796) 
      drop(242, amt)
      log("`9Dropped `#".. amt .. "`` World lock") 
      return true
    end
    if str:find("/dd (%d+)") then
      local amt = str:match("/dd (%d+)") 
      wear(7188) 
      drop(1796, amt)
      log("`9Dropped `#".. amt .. "`` Diamond lock") 
      return true
    end
    if str:find("/db (%d+)") then
      local amt = str:match("/db (%d+)")
      drop(7188, amt)
      log("`9Dropped `#".. amt .. "`` Blue Gem lock") 
      return true
    end
    if str:find("/ping") then
      local ping = getLocal().ping
      text = ""
      if ping >= 400 then
        text = "`4"
      elseif ping >= 200 then
        text = "`9"
      else
        text = "`2"
        log("Current Ping : ".. text .. ping) 
      end
      return true
    end
    if str:find("/daw") then
      for _, e in pairs(getInventory()) do
        if e.id == 242 and e.id == 1796 and e.id == 7188 then
          drop(e.id, e.amount) 
          log("`2ALL IN") 
        end
      end
      return true
    end
    return false
  end
)
hax.hook("OnVarlist","Kontrol", function(var) 
    if var[0] == "OnConsoleMessage" then
      log(var[1]) 
      return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("item_drop") then
      if var[1]:find("World Lock") or var[1]:find("Diamond Lock") or var[1]:find("Blue Gem Lock") then
        return true
      end
    end
return false
  end
) 

log("`4Costume API Loaded!") 
sleep(200) 
log("Hello ".. getLocal().name.. "\nDiscordUID : ".. getDiscordID().. "\nUserID : ".. getLocal().userId) 
sleep(200) 
overText("Have Fun!!!!!!") 
