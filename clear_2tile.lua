local x = {
  ["hit"] = function(a, b);sendPacketRaw(false,
      {
        type = 3,
        value = 18,
        x = getLocal().pos.x, 
        y = getLocal().pos.y, 
        punchx = a, 
        punchy = b
      }
)
end, ["n"] = function(...);return logToConsole(table.concat{...});end
}
local z = {["v"] = function() local function c(o);for a = 24, 53 do;local e = checkTile(o, a);local r = checkTile(o +1, a);if (e.bg == 14 and e.fg ~= 8) or (r.bg == 14 and r.fg ~= 8) then;findPath(o, a -1);sleep(math.random(120, 180));while e.bg == 14 and e.fg ~= 8 do;x["hit"](o, a);sleep(200);e = checkTile(o, a);end
while r.bg == 14 and r.fg ~= 8 do;x["hit"](o +1, a);sleep(200);r = checkTile(o +1, a);end;end;end;end
for _ = 0, 98, 2 do;c(_);end;end
}
x["n"]("`9Script Active!")
z["v"]()
x["n"]("`9".. getWorld().name.. " Has Been `#Cleared!")