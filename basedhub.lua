local Players = game:GetService("Players")
local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()

local user = game.Players.LocalPlayer
_G.closeBind = Enum.KeyCode.RightShift
_G.chosenColor = Color3.fromRGB(200, 0, 25)
_G.typedUser = ""

--Main UI
local win = Flux:Window("BasedHUB", "Welcome, "..user.Name.."!", _G.chosenColor, _G.closeBind)

--Credits
local tab1 = win:Tab("Credits", "http://www.roblox.com/asset/?id=6022668946")
tab1:Label("GUI Made by ren")
tab1:Label("libUi used was Flux")
tab1:Label("Press RightShift to close/open the GUI")
tab1:Line()
tab1:Button("Notification Test", "Notification System can break commonly, check if it's working", function()
    Flux:Notification("Notification system is working", "Confirm")
end)

--Local Player
local tab2 = win:Tab("Local Player", "http://www.roblox.com/asset/?id=6023426915")
tab2:Label("Humanoid sliders")
tab2:Line()
tab2:Slider("Walkspeed", "Changes your walkspeed", 0, 150, 16, function(t)
    local plrService = game:GetService("Players")
    local plr = plrService.LocalPlayer
    local char = plr.Character
    char.Humanoid.WalkSpeed = t
end)
tab2:Slider("Jump power", "Changes your jump height", 0, 200, 50, function(t)
    local plrService = game:GetService("Players")
    local plr = plrService.LocalPlayer
    local char = plr.Character
    char.Humanoid.JumpPower = t
end)
tab2:Line()
tab2:Toggle("Noclip", "Your fellow Casper the Ghost!👻", false, function(t)
    Flux:Notification("This feature is a work in progress", "Confirm")
end)
tab2:Line()
tab2:Textbox("Username", "Type in a players username to use the features bellow", true, function(t) 
    _G.typedUser = t
    print(_G.typedUser)
end)
tab2:Button("Attach to Back", "Press X to attach to someone's back", function()
    local UIS = game:GetService("UserInputService")
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    local t2
    
    UIS.InputBegan:Connect(function(i, t)
        if i.KeyCode == Enum.KeyCode.X and not t then
            local target = Mouse.Target
            if target ~= nil and target.Parent:FindFirstChild("Humanoid") and not t then
                t2 = true
                if (Player.Character.Head.Position - target.Parent.Head.Position).Magnitude < 100  and t2 then
                    while wait() do
                        Player.Character.HumanoidRootPart.CFrame = target.Parent.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                        if t2 == false then
                            break
                        end
                    end
                end
            else
                t2 = false
                target = nil
            end
        end
    end)
end)

---ScriptHub

local hub = win:Tab("Scripts", "http://www.roblox.com/asset/?id=6022668955")
hub:Button("Infinity Yield", "Basic FE admin script", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")()
end)
hub:Button("UnNamed ESP", "Undetectable ESP works for most executors", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua")()
end)
hub:Button("DarkDex", "This script allows you to see the explorer of the game and SaveInstance games", function()
loadstring(game:HttpGet"https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4")()
end)
hub:Button("Remote Spy", "Logs all of the remotes, allows for you to make your own scripts for the game", function()
    loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)
hub:Button("Script Viewer", "Shows how most scripts work like", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/dva01xpE", true))()
end)

--Games

local gamesicon = "http://www.roblox.com/asset/?id=6022668883"
if game.PlaceId == 155615604 then 
    local plife = win:Tab("Prison Life", gamesicon)
    plife:Label("Prison Life 2 -- Some scripts have been taken and edited")
    plife:Line()
    plife:Button("Destroy doors", "Destroys all doors/gates", function ()
        game.Workspace:WaitForChild("Doors"):Destroy()
        game.Workspace.Prison_Cellblock:WaitForChild("doors"):Destroy()
        game.Workspace.Prison_Fences:WaitForChild("Prison_Gate"):Destroy()
    end)
    plife:Dropdown("Item Giver", {"M9", "AK-47", "Remington 870", "M4A1",}, function(t)
        workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[t].ITEMPICKUP)
        wait(0.1)
        local aaa = game:GetService("Players").LocalPlayer
        local inf = math.huge
        local s = game:GetService("Players").LocalPlayer.Backpack[t]
        local b = game:GetService("Players").LocalPlayer.Backpack[t]:FindFirstChild("GunStates")
        local c = require(s:FindFirstChild("GunStates"))
        c["MaxAmmo"] = inf
        c["CurrentAmmo"] = inf
        c["StoredAmmo"] = inf
        c["FireRate"] = 0
        c["AutoFire"] = true
        c["Damage"] = inf
    end)

    plife:Dropdown("Teleport", {"Criminal Spawn", "Prison Yard", "Prison Cells", "Cafteria", "Gas Station", "Armory+", "Neighbourhood"}, function(t)
        local chr = user.Character
        local humroot = chr.HumanoidRootPart
        if t == "Prison Cells" then
            humroot.CFrame = CFrame.new(915.384, 99.99, 2442.7)
        elseif t == "Criminal Spawn" then
            humroot.CFrame = CFrame.new(-920.834, 95.3272, 2138.52)
        elseif t == "Prison Yard" then
            humroot.CFrame = CFrame.new(785.327, 97.9999, 2459.7)
        elseif t == "Cafteria" then
            humroot.CFrame = CFrame.new(920.517, 99.9899, 2288.45)
        elseif t == "Gas Station" then
            humroot.CFrame = CFrame.new(-519.832, 54.3938, 1657.83)
        elseif t == "Armory+" then
            humroot.CFrame = CFrame.new(403.706, 11.8253, 1166.26)
        elseif t == "Neighbourhood" then
            humroot.CFrame = CFrame.new(-324.55, 54.1751, 2485.79)
        end
    end)
    plife:Dropdown("Team Set", {"Criminal", "Guard", "Prisoner", "Neutral"}, function(t)
        local Workspace = game.Workspace
        if t == "Criminal" then
            Flux:Notification("This feature is still a work in progress", "Confirm")
        elseif t == "Guard" then
            Workspace.Remote.TeamEvent:FireServer("Bright blue")
        elseif t == "Prisoner" then
            Flux:Notification("This feature is still a work in progress", "Confirm")
        elseif t == "Neutral" then
            Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
        end
    end)
    plife:Toggle("Arrest Aura", "Arrests everybody in a radius to you", false, function(t)
        Flux:Notification("This feature is still a work in progress", "Confirm")
    end)
    plife:Button("Arrest All", "Teleports to every criminal and arrests all", function()
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
            local i = 10
            repeat
            wait()
            i = i-1
            game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        Player.Character.HumanoidRootPart.CFrame = cpos
        Flux:Notification("Arrested all", "Confirm")
    end)
end

--Config
local configtab = win:Tab("UI Config", "http://www.roblox.com/asset/?id=6031280882")
configtab:Label("Settings")
configtab:Line()
