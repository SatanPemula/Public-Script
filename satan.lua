discord = getDiscordID() 
local trash = false
local owner = "`4[ S  x  T  x  N ]`` "

function on_logout() 
sendVariant({
[0] = "OnLogout", 
}, -1) 
end

function on_reconnect() 
sendVariant({
[0] = "OnReconnect", 
}, -1) 
end

function log(str) 
logToConsole(owner.. str) 
end

function logTime(satan, satanSleep) 
  logToConsole("`9Script Loading...")
  sendVariant({
    [0] = "OnSetMissionTimer", 
    [1] = satan, 
  },-1)
sleep(satanSleep)
sendVariant({[0] = "OnEndMission", }, -1) 
end
logTime(3, 3000)

opening = [[
add_label_with_icon|big|`7Account Profile``|left|12436|
add_textbox|Hallo ]]..getLocal().name ..[[`` Ini Adalah Account Profile Kamu :3|
add_textbox|=========================``|left|
add_label_with_icon|small|`0UID : `b]]..getLocal().userId..[[|left|482|
add_label_with_icon|small|`0GENTA UID : `b]]..getDiscordID()..[[|left|482|
add_label_with_icon|small|`0U Standing At `9]]..getWorld().name..[[|left|482|
add_label_with_icon|small|`0Your Position : `9[ ]]..(getLocal().pos.x//32)..[[ - ]]..(getLocal().pos.y//32)..[[ ]|left|482|
add_textbox|=========================``|left|
add_spacer|small|
text_scaling_string|satankontoljzsj|
add_button_with_icon|clog|`cChange Log|staticGreyFrame|6128||
add_button_with_icon|cmd|`cCommand List|staticGreyFrame|32||
add_button_with_icon|helper|`cHelper Status|staticGreyFrame|1796||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small||
end_dialog|fakedial|Close||
]]
a = {}
a[0] = "OnDialogRequest"
a[1] = opening
sendVariant(a, -1, 200)

AddHook("OnTextPacket","CommandList", function(type, satan) 
if satan:find("/ping") then
local ping = getLocal().ping
local pingColor = ""
if ping >= 400 then
pingColor = "`4"
elseif ping >= 200 then
pingColor = "`9"
else
pingColor = "`2"
log("Current Ping : ".. pingColor.. ping) 
return true
end
end
if satan:find("/command") then
local str = ">>> Command List : /ping /profile /trashstart /trashend /fastdrop /spawn"
log(str) 
return true
end
if satan:find("/trashstart") then
if trash == false then
trash = true
log("Fast Trash `2Enable.") 
return true
end
end
if satan:find("/trashend") then
if trash == true then
trash = false
log("Fast Trash `4Disable") 
return true
end
end
return false
end) 

AddHook("OnVarlist","Hookied",function(var)
  if var[0] == "OnConsoleMessage" then
    log(var[1]) 
    return true
  end
  if var[0] == "OnDialogRequest" and var[1]:find("drop_item") then
    if var[1]:find("World Lock") or var[1]:find("Diamond Lock") or var[1]:find("Blue Gem Lock") then
      return true
    end
  end
  if var[0] == "OnDialogRequest" and var[1]:find("trash_item") and trash then
    local item, amount = 
    tonumber(var[1]:match("embed_data|itemID|(%d+)"))
    tonumber(var[1]:match("add_text_input|count||(%d+)|%d+|")), 
    sendPacket(2, string.format("action|trash\n|itemID|%d",item))
    sendPacket(2, string.format("action|dialog_return\ndialog_name|trash_item\nitemID|%d|\ncount|%d",item,amount))
    return true
  end
  return false
end
) 