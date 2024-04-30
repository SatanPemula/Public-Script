discord = getDiscordID()
function log(str) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = str, 
    }) 
end

log(" Hello User ! ") 
sleep(1000) 
log(" User ID : "..discord)
