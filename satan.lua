discord = getDiscordID()
function log(str) 
  sendVariant({
      [0] = "OnTextOverlay", 
      [1] = str, 
    }) 
end

log(" Hello User ! ") 
log(discord)
