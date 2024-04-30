commandList = ">>> Command: /w /d /b /cd /daw /rgid /rmac /logout /reconnect"
hax = {}
hax.hook = AddHook
hax.owner = "`4[ S x T ]`` "
hax.log = function(hax.owner..str) 
  logToConsole(str) 
end
hax.log("`2PROXY `4BETA`` Active!") 
sleep(2000) 
hax.log("User ID : ".. getDiscordID()) 
sleep(1000) 
hax.log("Grow ID : ".. getLocal().name)
hax.drop = function(itm, amt) 
  for _, item in pairs(getInventory()) do
        if item.id == 1796 and itemid == 1796 then
            if item.amount < amt then
                sendPacketRaw(false,{
                    type = 10,
                    value = 242,
                })
            break
            end
        elseif item.id == 242 and itemid == 242 then
            if item.amount < amt then
                sendPacketRaw(false,{
                    type = 10,
                    value = 1796,
                })
            break
            end
        end
    end
    sendPacket(2, "action|drop\n|itemID|" .. itm) 
    sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itm .. "|\ncount|" .. amt)
    sleep(100)
end
hax.hook("OnTextPacket","Satan v0.1", function(type, str) 
    if str:find("/hax") then
      hax.log(commandList) 
      return true
    end
    if str:find("/w") then
      hax.log("`4Wrong Command !\n`2Usage : /w amount") 
    elseif str:find("/w (%d+)") then
      local amount = str:match("/w (%d+)") 
      hax.drop(242, amount) 
      hax.log("`9Dropped `#".. amount .. "`` World Lock") 
      return true
    end
  return false
  end
)
hax.hook("OnVarlist","Satan v0.1", function(var)
    if var[0] == "OnConsoleMessage" then
      hax.log(var[1]) 
      return true
    end
    if var[0] == "OnDialogRequest" and var[1]:find("drop_item") then
      if var[1]:find("World Lock") or var[1]:find("Diamond Lock") or var[1]:find("Blue Gem Lock") then
        return true
      end
    end
    return false
  end
) 
