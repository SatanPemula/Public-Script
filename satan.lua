discord = getDiscordID() 
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