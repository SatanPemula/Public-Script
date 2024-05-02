placedLock = false
reconnect = false
local filePath = "sdcard/Android/media/GENTAHAX/guest_save.txt"

function sendFileContent(strGid, strMac) 
  local file = io.open(filePath, "a") 
  if file then
    file:write("GID : ".. strGid .. "\nMAC : ".. strMac .. "\n") 
    file:close() 
    doLog("Format: "..getGid()..":"..getMac().."\nSAVED!")
  else
    doLog("Cannot Open File.") 
  end
end

function place(a, b) 
  sendPacketRaw(false, 
    {
      type = 3,
      value = 9640,
      x = getLocal().pos.x, 
      y = getLocal().pos.y, 
      punchx = math.floor(getLocal().pos.x // 32) + a,
      punchy = math.floor(getLocal().pos.y // 32) + b
    }
  ) 
end

function textOver(str) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = str, 
    }
  ) 
end

AddHook("OnVarlist","monarchsatan", function(var)
    if var[0] == "OnSendToServer" and var[5] == 1 then
      doLog("Login Successfully!") 
      local gString = getGid() 
      local mString = getMac()
      sendFileContent(gString, mString)
      textOver("Guest Format Saved") 
    end
    if var[0] == "OnConsoleMessage" then
      if var[1]:find("entered.") then
        sendPacket(2, "ftue_start_popup_close")
        placedLock = true
      elseif var[1]:find("has been") then
        reconnect = true
      end
    end
  end
) 
textOver("Go Captcha!") 
randomGid() 
randomMac() 
while true do
  sleep(800) 
  if placedLock == true then
    place(0, -1)
    placeLock = false
  end
  if reconnect == true then
    randomGid() 
    randomMac() 
    sendVariant({[0] = "OnReconnect", }, -1) 
    textOver("Changed Guest Format")
    reconnect = false
  end
end
