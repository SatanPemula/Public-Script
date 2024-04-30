commandList = [[
>>> Command: /w /d /b /cd /daw
]]
hax = {}
hax.owner = "`4[ S x T ]`` "
hax.log = function(str) 
  logToConsole(str) 
end
hax.log("`2PROXY `4BETA`` Active!") 
sleep(2000) 
hax.log("User ID : ".. getDiscordID()) 
hax.log("Grow ID : ".. getLocal().name)

hax.getBal = function()
  for _, b in pairs(getInventory()) do
  if b.id == 242 then
      return b.amount 
    end
  end
  return b.amount
end
hax.log("Balance : ".. hax.getBal())
