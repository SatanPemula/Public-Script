local char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local hax = {}
local length = 4 
local logFossil = false
local logObject = false
local owner = "[ S  x  T  x  N ] "

function log(st) 
  logToConsole(owner.. st) 
end

function warp(world) 
  sendPacket(3, "action|join_request\nname|".. world) 
end

for obj in char:gmatch(".") do
  table.insert(hax, obj) 
end

function gen() 
  obj = ""
  for i = 1, length do
    obj = obj .. hax[math.random(1, #hax)]
  end
  return obj:upper() 
end

function box(bool) 
  local str = ""
  if bool then
    str = "1"
  else
    str = "0"
  end
  return str
end

AddHook("OnTextPacket","Hookied", function(type, str) 
    if str:find("/ping") then
      local ping = getLocal().ping
      local pingColor = ""
      if ping >= 300 then
        pingColor = "`4"
      elseif ping >= 250 then
        pingColor = `9"
      else
        pingColor = "`2"
      end
      log("Current Ping : ".. pingColor..ping) 
      return true
    end
    return false
  end
) 
