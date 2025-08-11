repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))() end)
_G.Config = { UserID = "23bd740b-d966-4d71-9b91-6dc9806d07fd", discord_id = "1026799803155361832" , Note = "Pc", }  task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/skadidau/unfazedfree/refs/heads/main/gag"))() end)
local t4n7y1w0zvm = game:GetService("Lighting")
local b5k6r0quapx = workspace:FindFirstChildOfClass("Terrain")
local m3q0jxswz2c = game:GetService("CoreGui")
local vq79w1hz2jd = game:GetService("Players")
local e68zjthq5oy = vq79w1hz2jd.LocalPlayer

local function b9p7zq0cvsx(p1ku0x4wnhb)
    pcall(function()
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
    end)
end

task.spawn(function()
    pcall(function()
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
end)

task.spawn(function()
    pcall(function()
        if b5k6r0quapx then
            b5k6r0quapx.WaterTransparency = 0
            b5k6r0quapx.WaterWaveSize = 0
            b5k6r0quapx.WaterReflectance = 0
            b5k6r0quapx.WaterColor = Color3.new(0, 0, 0)
            b5k6r0quapx.MaterialColors = Enum.MaterialColors.Plain
        end
    end)
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
    pcall(function()
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
            pcall(function()
                if c0zhnawqpo1:GetAttribute("FarZ") then
                    c0zhnawqpo1:SetAttribute("FarZ", 0)
                end
            end)
        end
    end)
end)
getgenv().Key = "079a407d0e28b243a65af94c"
getgenv().Config = {
    ["Pet"] = {
        ["Name Pet"] = {"Kitsune", "Butterfly", "Dragonfly", "Mimic Octopus", "Disco Bee", "Butterfly", "Moon Cat", "Red Fox", "T-Rex", "Spinosaurus", "Dilophosaurus", "Raccoon", "Capybara"},
        ["Auto Mutation Pet"] = {},
        ["Delete Pet Other"] = false,
    },
    ["Webhook"] = {
        ["Enabled"] = false,
        ["Url"] = "",
        ["Webhook Profile"] = false,
        ["Webhook Collect Egg"] = false,
    },
    ["Boost FPS"] = {
        ["Set FPS"] = {
            ["Enabled"] = false,
            ["FPS"] = 30
        },
        ["White Screen"] = true,
        ["Black Screen"] = false,
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/KaitunGAG.lua"))()
