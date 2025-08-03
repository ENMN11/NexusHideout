repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))) end)
_G.Team = "Pirate" -- Marine / Pirate
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 30,
    ['WhiteScreen'] = false,
    ['CloseUI'] = true,
    ["NotifycationExPRemove"] = true,
    ['AFKCheck'] = 180,
    ["LockFragments"] = 0,
    ["LockFruitsRaid"] = {
        [1] = "Dough-Dough",
        [2] = "Dragon-Dragon",        
    }
}
_G.SharkAnchor_Settings = {
    ["Enabled_Farm"] = false,
    ['FarmAfterMoney'] = 0
}
_G.Quests_Settings = {        
    ['Rainbow_Haki'] = false,
    ["MusketeerHat"] = false,
    ["PullLever"] = false,
    ['DoughQuests_Mirror'] = {
        ['Enabled'] = false,
        ['UseFruits'] = false
    }        
}
_G.Races_Settings = {
    ['Race'] = {
        ['EnabledEvo'] = false,
        ["v2"] = false,
        ["v3"] = false,
        ["Races_Lock"] = {
            ["Races"] = {
                ["Mink"] = false,
                ["Human"] = false,
                ["Fishman"] = false
            },
            ["RerollsWhenFragments"] = 0
        }
    }
}
_G.Fruits_Settings = {
    ['Main_Fruits'] = {''},
    ['Select_Fruits'] = {""}
}
_G.Settings_Melee = {
    ['Superhuman'] = true,
    ['DeathStep'] = true,
    ['SharkmanKarate'] = true,
    ['ElectricClaw'] = true,
    ['DragonTalon'] = true,
    ['Godhuman'] = true
}
_G.SwordSettings = {
    ['Saber'] = false,
    ["Pole"] = false,
    ['MidnightBlade'] = false,
    ['Shisui'] = false,
    ['Saddi'] = false,
    ['Wando'] = false,
    ['Yama'] = false,
    ['Rengoku'] = false,
    ['Canvander'] = false,
    ['BuddySword'] = false,
    ['TwinHooks'] = false,
    ['HallowScryte'] = false,
    ['falseTripleKatana'] = false,
    ['CursedDualKatana'] = false
}
_G.GunSettings = {
    ['Kabucha'] = false,
    ['SerpentBow'] = false,
    ['SoulGuitar'] = false
}
_G.FarmMastery_Settings = {
    ['Melee'] = false,
    ['Sword'] = false,
    ['DevilFruits'] = false,
    ['Select_Swords'] = {
        ["AutoSettings"] = false,
        ["ManualSettings"] = {
            "Saber",
            "Buddy Sword"
        }
    }
}
_G.Hop_Settings = {
    ["Find Tushita"] = false
}
getgenv().Hermanos_Settings = {
    ['key'] = '3c148cb4-fbbd-486d-993a-31e158ceee42',
    ['PC'] = 'Nexus',
    ['webhooks'] = {
        ['fullmoon'] = '',
        ['mirage'] = '',
    },
    ['Sword'] = {'Cursed Dual Katana', 'Shark Anchor', 'Tushita', 'Yama', 'Dark Dagger', 'Hallow Scythe', 'Saber'},
    ['Gun'] = {'Skull Guitar', 'Serpent Bow', 'Kabucha', 'Acidum Rifle'},
    ['Accessories'] = {'Dark Coat', 'Leviathan Shield', 'Leviathan Crown', 'Pale Scarf', 'Kitsune Mask', 'Kitsune Ribbon'},
    ['Fruit'] = {
        'Kitsune', 'Leopard', 'Dragon (West)', 'Spirit', 'Control', 'Venom', 'Gas', 'Yeti', 'Creation', 'Gravity', 'Sound', 'Pain',
        'Shadow', 'Dough', 'Mammoth', 'T-Rex', 'Dragon (East)', 'Buddha', 'Spider', 'Love', 'Rumble', 'Buddha', 'Quake', 'Phoenix', 'Blizzard'
    }
}
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/main.lua"))) end)
game:GetService("RunService"):Set3dRenderingEnabled(false)
local t4n7y1w0zvm = game:GetService("Lighting")
local b5k6r0quapx = workspace:FindFirstChildOfClass("Terrain")
local vq79w1hz2jd = game:GetService("Players")
local e68zjthq5oy = vq79w1hz2jd.LocalPlayer

coroutine.wrap(function()
    pcall(function()
        local function b9p7zq0cvsx(p1ku0x4wnhb)
            if p1ku0x4wnhb:IsA("BasePart") or p1ku0x4wnhb:IsA("Decal") or p1ku0x4wnhb:IsA("Texture") then
                p1ku0x4wnhb.Transparency = 1
                local d81rmf3uc5a = p1ku0x4wnhb:FindFirstChildOfClass("Texture")
                if d81rmf3uc5a then
                    d81rmf3uc5a:Destroy()
                end
            elseif p1ku0x4wnhb:IsA("ParticleEmitter") or p1ku0x4wnhb:IsA("Trail") or p1ku0x4wnhb:IsA("Beam") then
                p1ku0x4wnhb.Enabled = false
            elseif p1ku0x4wnhb:IsA("Fire") or p1ku0x4wnhb:IsA("Smoke") or p1ku0x4wnhb:IsA("Sparkles") or p1ku0x4wnhb:IsA("Explosion") or p1ku0x4wnhb:IsA("Highlight") or p1ku0x4wnhb:IsA("Shimmer") then
                p1ku0x4wnhb:Destroy()
            elseif p1ku0x4wnhb:IsA("Sound") then
                p1ku0x4wnhb.Volume = 0
                p1ku0x4wnhb:Stop()
                p1ku0x4wnhb.Playing = false
            elseif p1ku0x4wnhb:IsA("Animation") or p1ku0x4wnhb:IsA("AnimationTrack") then
                p1ku0x4wnhb:Destroy()
            elseif p1ku0x4wnhb:IsA("Humanoid") then
                for _, s10xwv3q9lc in next, p1ku0x4wnhb:GetPlayingAnimationTracks() do
                    s10xwv3q9lc:Stop()
                end
            end
        end

        t4n7y1w0zvm.GlobalShadows = false
        t4n7y1w0zvm.FogStart = 0
        t4n7y1w0zvm.FogEnd = 0
        t4n7y1w0zvm.Brightness = 0
        t4n7y1w0zvm.OutdoorAmbient = Color3.new(0, 0, 0)
        t4n7y1w0zvm.Ambient = Color3.new(0, 0, 0)
        for _, child in ipairs(t4n7y1w0zvm:GetChildren()) do
            if child:IsA("Sky") or child:IsA("SunRaysEffect") or child:IsA("BloomEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("BlurEffect") then
                child:Destroy()
            end
        end

        if b5k6r0quapx then
            b5k6r0quapx.WaterTransparency = 1
            b5k6r0quapx.WaterWaveSize = 0
            b5k6r0quapx.WaterReflectance = 0
            b5k6r0quapx.WaterColor = Color3.new(0, 0, 0)
            b5k6r0quapx.MaterialColors = Enum.MaterialColors.Plain
        end

        for _, obj in next, workspace:GetDescendants() do
            b9p7zq0cvsx(obj)
        end
        for _, nilInst in next, getnilinstances() do
            b9p7zq0cvsx(nilInst)
            for _, d in next, nilInst:GetDescendants() do
                b9p7zq0cvsx(d)
            end
        end

        local cam = workspace.CurrentCamera
        if cam then
            cam.FieldOfView = 1
            cam.CameraSubject = nil
            cam.CameraType = Enum.CameraType.Scriptable
            cam.Focus = cam.Focus
            cam.CFrame = cam.CFrame
            for _, c in ipairs(cam:GetChildren()) do
                if c:IsA("PostEffect") or c:IsA("BlurEffect") or c:IsA("ColorCorrectionEffect") or c:IsA("DepthOfFieldEffect") then
                    c:Destroy()
                end
            end
            if cam:FindFirstChildOfClass("AnimationTrack") then
                cam:FindFirstChildOfClass("AnimationTrack"):Stop()
                cam:FindFirstChildOfClass("AnimationTrack"):Destroy()
            end
            if cam:FindFirstChild("FarPlane") then
                cam.FarPlane = 0
            end
            if cam:GetAttribute("FarZ") then
                cam:SetAttribute("FarZ", 0)
            end
            if cam:GetAttribute("MaxDistance") then
                cam:SetAttribute("MaxDistance", 0)
            end
            if cam:GetAttribute("MaxAxisFieldOfView") then
                cam:SetAttribute("MaxAxisFieldOfView", 1)
            end
        end
    end)
end)()

workspace.DescendantAdded:Connect(function(obj)
    coroutine.wrap(function()
        pcall(function()
            local function b9p7zq0cvsx(p1ku0x4wnhb)
                if p1ku0x4wnhb:IsA("BasePart") or p1ku0x4wnhb:IsA("Decal") or p1ku0x4wnhb:IsA("Texture") then
                    p1ku0x4wnhb.Transparency = 1
                    local d81rmf3uc5a = p1ku0x4wnhb:FindFirstChildOfClass("Texture")
                    if d81rmf3uc5a then
                        d81rmf3uc5a:Destroy()
                    end
                elseif p1ku0x4wnhb:IsA("ParticleEmitter") or p1ku0x4wnhb:IsA("Trail") or p1ku0x4wnhb:IsA("Beam") then
                    p1ku0x4wnhb.Enabled = false
                elseif p1ku0x4wnhb:IsA("Fire") or p1ku0x4wnhb:IsA("Smoke") or p1ku0x4wnhb:IsA("Sparkles") or p1ku0x4wnhb:IsA("Explosion") or p1ku0x4wnhb:IsA("Highlight") or p1ku0x4wnhb:IsA("Shimmer") then
                    p1ku0x4wnhb:Destroy()
                elseif p1ku0x4wnhb:IsA("Sound") then
                    p1ku0x4wnhb.Volume = 0
                    p1ku0x4wnhb:Stop()
                    p1ku0x4wnhb.Playing = false
                elseif p1ku0x4wnhb:IsA("Animation") or p1ku0x4wnhb:IsA("AnimationTrack") then
                    p1ku0x4wnhb:Destroy()
                elseif p1ku0x4wnhb:IsA("Humanoid") then
                    for _, s10xwv3q9lc in next, p1ku0x4wnhb:GetPlayingAnimationTracks() do
                        s10xwv3q9lc:Stop()
                    end
                end
            end
            b9p7zq0cvsx(obj)
        end)
    end)()
end)
getgenv().Key = "MARU-XUV1V-I01J-CNQ2P-IZI1-A9NNW"
getgenv().id = "1139083335713439784"
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))) end)
