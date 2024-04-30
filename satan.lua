hax = {}
hax.exe = function(hi) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = hi, 
    }) 
end
hax.exe("`4Script is Running!")
sleep(2000) 
hax.exe("Hello User ".. getDiscordID() .. "!") 

AddHook("OnVarlist","SatanHook", function(var) 
    if var[0] == "OnConsoleMessage" then
      logToConsole("`4[S x T]`` ".. var[1]) 
      return true
    end
    return false
  end) 
