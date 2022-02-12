local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/Simak90/pfsetcetc/main/fluxed.lua")()

local user = game.Players.LocalPlayer.Name 
_G.closeBind = Enum.KeyCode.C
_G.chosenColor = Color3.fromRGB(200, 0, 25)

--Main UI
local win = Flux:Window("BasedHUB", "Welcome, "..user.."!", Color3.fromRGB(200, 0, 25), _G.closeBind)

--Credits
local tab1 = win:Tab("Credits", "http://www.roblox.com/asset/?id=6022668946")
tab1:Label("GUI Made by ren")
tab1:Label("libUi used was Flux")

--Local Player
local tab1 = win:Tab("Local Player", "http://www.roblox.com/asset/?id=6023426915")
tab1:Slider("Walkspeed", "Changes your walkspeed.", 16, 100, 16, function(t)
    user.Character.Humanoid.Walkspeed = t
end)

---ScriptHub
local hub = win:Tab("Scripts", "http://www.roblox.com/asset/?id=6023426938")
hub:Button("Infinity Yield", "Basic FE admin script", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")()
end)
hub:Button("UnNamed ESP", "This ESP might not support your executor!!!", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua")()
end)
hub:Button("DarkDex", "This script allows you to see the explorer of the game and SaveInstance games.", function()
loadstring(game:HttpGet"https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4")()
end)

--Config
--[[
local configtab = win:Tab("UI Config", "http://www.roblox.com/asset/?id=6031280882")
configtab:Label("Settings")
configtab:Colorpicker("Recolor the UI(W.I.P)", Color3.fromRGB(255, 255, 255), function(t) -- Color is the base color
    print(t)
end)
--]]

