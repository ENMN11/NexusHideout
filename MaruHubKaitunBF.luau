repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
local t4n7y1w0zvm = game:GetService("Lighting")
local b5k6r0quapx = workspace:FindFirstChildOfClass("Terrain")
local m3q0jxswz2c = game:GetService("CoreGui")
local vq79w1hz2jd = game:GetService("Players")
local e68zjthq5oy = vq79w1hz2jd.LocalPlayer

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
        p1ku0x4wnhb:Stop()
    elseif p1ku0x4wnhb:IsA("Animation") or p1ku0x4wnhb:IsA("AnimationTrack") then
        p1ku0x4wnhb:Destroy()
    elseif p1ku0x4wnhb:IsA("Humanoid") then
        for _, s10xwv3q9lc in next, p1ku0x4wnhb:GetPlayingAnimationTracks() do
            s10xwv3q9lc:Stop()
        end
    end
end

task.spawn(function()
    t4n7y1w0zvm.GlobalShadows = false
    t4n7y1w0zvm.FogStart = 0
    t4n7y1w0zvm.FogEnd = 0
    t4n7y1w0zvm.Brightness = 0
    t4n7y1w0zvm.OutdoorAmbient = Color3.new(0, 0, 0)
    t4n7y1w0zvm.Ambient = Color3.new(0, 0, 0)
    for _, c7z5hqgdxlo in ipairs(t4n7y1w0zvm:GetChildren()) do
        if c7z5hqgdxlo:IsA("Sky") or c7z5hqgdxlo:IsA("SunRaysEffect") or c7z5hqgdxlo:IsA("BloomEffect") or c7z5hqgdxlo:IsA("ColorCorrectionEffect") or c7z5hqgdxlo:IsA("BlurEffect") then
            c7z5hqgdxlo:Destroy()
        end
    end
end)

task.spawn(function()
    if b5k6r0quapx then
        b5k6r0quapx.WaterTransparency = 0
        b5k6r0quapx.WaterWaveSize = 0
        b5k6r0quapx.WaterReflectance = 0
        b5k6r0quapx.WaterColor = Color3.new(0, 0, 0)
        b5k6r0quapx.MaterialColors = Enum.MaterialColors.Plain
    end
end)

task.spawn(function()
    for _, c4nz2hsdo7v in next, workspace:GetDescendants() do
        b9p7zq0cvsx(c4nz2hsdo7v)
    end
    for _, r8okpwvg6qx in next, getnilinstances() do
        b9p7zq0cvsx(r8okpwvg6qx)
        for _, f0im9jzhbxv in next, r8okpwvg6qx:GetDescendants() do
            b9p7zq0cvsx(f0im9jzhbxv)
        end
    end
end)

workspace.DescendantAdded:Connect(function(jhx94q8ldmn)
    task.spawn(function()
        b9p7zq0cvsx(jhx94q8ldmn)
    end)
end)

task.spawn(function()
    local c0zhnawqpo1 = workspace.CurrentCamera
    if c0zhnawqpo1 then
        c0zhnawqpo1.FieldOfView = 1
        c0zhnawqpo1.CameraSubject = nil
        c0zhnawqpo1.CameraType = Enum.CameraType.Scriptable
        c0zhnawqpo1.Focus = c0zhnawqpo1.Focus
        c0zhnawqpo1.CFrame = c0zhnawqpo1.CFrame
        if c0zhnawqpo1:FindFirstChild("FarPlane") then
            c0zhnawqpo1.FarPlane = 0
        end
        if c0zhnawqpo1:GetAttribute("FarZ") then
            c0zhnawqpo1:SetAttribute("FarZ", 0)
        end
    end
end)
_G.Team = "Pirate" -- Marine / Pirate
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 10,
    ['WhiteScreen'] = true,
    ['CloseUI'] = true,
    ["NotifycationExPRemove"] = true,
    ['AFKCheck'] = 120,
    ["LockFragments"] = 0,
    ["LockFruitsRaid"] = {
        [1] = "Dough-Dough",
        [2] = "Dragon-Dragon",        
    }
}
_G.SharkAnchor_Settings = {
    ["Enabled_Farm"] = false,
    ['FarmAfterMoney'] = 2500000
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
            ["RerollsWhenFragments"] = 20000
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
getgenv().Key = "MARU-0ZIBP-HP5E-XU4UU-HC4M-9RGFU"
getgenv().id = "1244913105998184458"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
