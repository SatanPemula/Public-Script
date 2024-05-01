-- GentaHax Custom API For Creative Ps
hax = {}
hax.owner = "`4[ S  x  T  x  N ]`` "
hax.hook = AddHook

function log(str) 
  logToConsole(owner.. str) 
end

function place(a, b, c) 
  sendPacketRaw(false,
    {
      type = 3,
      punchx = a, 
      punchy = b, 
      value = c, 
      x = getLocal().pos.x, 
      y = getLocal().pos.y
    }
  ) 
end

function plant(a, b, c) 
  place(a, b, c) 
end

function hit(a, b) 
  sendPacketRaw(false, 
    {
      type = 3,
      value = 18,
      punchx = x, 
      punchy = y, 
      x = getLocal().pos.x, 
      y = getLocal().pos.y
    }
  ) 
end

function drop(a, b) 
  sendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|"..a.."|\nitem_count|"..b.."\n\n")
end

function eat(itm) 
  sendPacketRaw(false, 
    {
      type = 3,
      value = itm, 
      punchx = getLocal().pos.x//32, 
      punchy = getLocal().pos.y//32, 
      x = getLocal().pos.x, 
      y = getLocal().pos.y
    }
  ) 
end

function overText(str) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = str, 
    }) 
end

function chat(str) 
  sendVariant({
      [0] = "OnTalkBubble", 
      [1] = getLocal().netId, 
      [2] = str, 
    }) 
end

function wear(itm) 
  sendPacketRaw(false, 
    {
      type = 10,
      value = itm
    }
  ) 
end

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
