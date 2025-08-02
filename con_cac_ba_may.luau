repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))) end)
getgenv().Key = "079a407d0e28b243a65af94c"
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = false,
                    ["All Fruit"] = false, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = false,
            ["FPS"] = 20,
        },
        ["Get Items"] = {
            ["Saber"] = false,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = false,
            ["Mirror Fractal"] = false,
            ["Cursed Dual Katana"] = false,
            ["Upgrade Race V2-V3"] = false,
            ["Auto Pull Lever"] = false,
            ["Shark Anchor"] = false, --- if have cdk,sg,godhuman
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = false, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = false,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "",
        },
        ["Auto Summon Rip Indra"] = false, --- auto buy haki and craft haki legendary 
        ["Select Hop"] = { -- 70% will have it
            ["Hop Server If Have Player Near"] = true, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = false, 
            ["Hop Find Dough King Get Mirror Fractal"] = false,
            ["Hop Find Raids Castle [CDK]"] = false,
            ["Hop Find Cake Queen [CDK]"] = false,
            ["Hop Find Soul Reaper [CDK]"] = false,
            ["Hop Find Darkbeard [SG]"] = false,
            ["Hop Find Mirage [ Pull Lever ]"] = false,
        },
        ["Farm Mastery"] = {
            ["Melee"] = false,
            ["Sword"] = false,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = true,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = false, -- Auto Buy Fruit in Shop Mirage and Normal
            ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
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
game:GetService("RunService"):Set3dRenderingEnabled(false)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/main.lua"))) end)
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
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))) end)
