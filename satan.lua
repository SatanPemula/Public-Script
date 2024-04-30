hax = {}
hax.exe = function(hi) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = hi, 
    }) 
end
hax.exe("`4Script is Running!")
sleep(2000) 
doLog("Hello User ".. getDiscordID() .. "!") 
