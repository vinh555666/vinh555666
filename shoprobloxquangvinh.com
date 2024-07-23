- 👋 Hi, I’m @vinh555666
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...

<!---
vinh555666/vinh555666 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
local button = script.Parent
local remote = game:GetService("ReplicatedStorage"):WaitForChild("ShopPurchaseBloxyCola")

button.Activated:Connect(function()
  remote:FireServer()
end)-- this code is different from the video but it will help

local currency = "Money" -- your currency's name, the currency used in the video was Money

local moneyamounttoadd = 5000 -- change this amount to how much money you want the player to get after they touch the part

local db = false

script.Parent.Touched:Connect(function(hit)
  if not db then
    db = true
    if hit.Parent:FindFirstChild("Humanoid") then
      local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
     local leaderstats = plr.leaderstats:FindFirstChild(currency)
     leaderstats.Value += moneyamounttoadd
   end
   wait()
   db = false
  end
end)-- this code is different from the video but it will help

local currency = "Money" -- your currency's name, the currency used in the video was Money

local moneyamounttoadd = 5000 -- change this amount to how much money you want the player to get after they touch the part

local db = false

script.Parent.Touched:Connect(function(hit)
  if not db then
    db = true
    if hit.Parent:FindFirstChild("Humanoid") then
      local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
     local leaderstats = plr.leaderstats:FindFirstChild(currency)
     leaderstats.Value += moneyamounttoadd
   end
   wait()
   db = false
  endlocal rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")

local currency = "Money" -- again, change this to your currency

local bloxycola = ss:WaitForChild("BloxyCola")
local flashlight = ss:WaitForChild("Flashlight")

local shop_cola = rs:WaitForChild("ShopPurchaseBloxyCola")
local shop_flash = rs:WaitForChild("Flashlight")

local colaprice = 10000
local flashprice = 15000

shop_cola.OnServerEvent:Connect(function(plr)
  local money = plr.leaderstats:FindFirstChild(currency)
  if money.Value >= colaprice then
    money.Value -= colaprice
    bloxycola:Clone().Parent = plr.Backpack
  end
end)

shop_flash.OnServerEvent:Connect(function(plr)
  local money = plr.leaderstats:FindFirstChild(currency)
  if money.Value >= flashprice then
    money.Value -= flashprice
    flashlight:Clone().Parent = plr.Backpack
  end
end)
end)
