repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))) end)
_G.Team = "Pirate"
getgenv().Key = "MARU-XUV1V-I01J-CNQ2P-IZI1-A9NNW"
getgenv().id = "1139083335713439784"
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    EnabledHOP = true,
    FPSBOOST = true,
    FPSLOCKAMOUNT = 30,
    WhiteScreen = false,
    CloseUI = true,
    NotifycationExPRemove = true,
    AFKCheck = 120,
    LockFragments = 0,
    LockFruitsRaid = {
        "Dough-Dough",
        "Dragon-Dragon",        
    }
}
_G.SharkAnchor_Settings = {
    Enabled_Farm = false,
    FarmAfterMoney = 2500000
}
_G.Quests_Settings = {        
    Rainbow_Haki = false,
    MusketeerHat = false,
    PullLever = false,
    DoughQuests_Mirror = {
        Enabled = false,
        UseFruits = false
    }        
}
_G.Races_Settings = {
    Race = {
        EnabledEvo = false,
        v2 = false,
        v3 = false,
        Races_Lock = {
            Races = {
                Mink = false,
                Human = false,
                Fishman = false
            },
            RerollsWhenFragments = 0
        }
    }
}
_G.Fruits_Settings = {
    Main_Fruits = {''},
    Select_Fruits = {""}
}
_G.Settings_Melee = {
    Superhuman = true,
    DeathStep = true,
    SharkmanKarate = true,
    ElectricClaw = true,
    DragonTalon = true,
    Godhuman = true
}
_G.SwordSettings = {
    Saber = false,
    Pole = false,
    MidnightBlade = false,
    Shisui = false,
    Saddi = false,
    Wando = false,
    Yama = false,
    Rengoku = false,
    Canvander = false,
    BuddySword = false,
    TwinHooks = false,
    HallowScryte = false,
    falseTripleKatana = false,
    CursedDualKatana = false
}
_G.GunSettings = {
    Kabucha = false,
    SerpentBow = false,
    SoulGuitar = false
}
_G.FarmMastery_Settings = {
    Melee = false,
    Sword = false,
    DevilFruits = false,
    Select_Swords = {
        AutoSettings = false,
        ManualSettings = {
            "Saber",
            "Buddy Sword"
        }
    }
}
_G.Hop_Settings = {
    Find Tushita = false
}
getgenv().Hermanos_Settings = {
    key = '3c148cb4-fbbd-486d-993a-31e158ceee42',
    PC = 'Nexus',
    webhooks = {
        fullmoon = '',
        mirage = '',
    },
    Sword = {'Cursed Dual Katana', 'Shark Anchor', 'Tushita', 'Yama', 'Dark Dagger', 'Hallow Scythe', 'Saber'},
    Gun = {'Skull Guitar', 'Serpent Bow', 'Kabucha', 'Acidum Rifle'},
    Accessories = {'Dark Coat', 'Leviathan Shield', 'Leviathan Crown', 'Pale Scarf', 'Kitsune Mask', 'Kitsune Ribbon'},
    Fruit = {
        'Kitsune', 'Leopard', 'Dragon (West)', 'Spirit', 'Control', 'Venom', 'Gas', 'Yeti', 'Creation', 'Gravity', 'Sound', 'Pain',
        'Shadow', 'Dough', 'Mammoth', 'T-Rex', 'Dragon (East)', 'Buddha', 'Spider', 'Love', 'Rumble', 'Buddha', 'Quake', 'Phoenix', 'Blizzard'
    }
}
game:GetService("RunService"):Set3dRenderingEnabled(false)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/main.lua"))) end)
task.spawn(function() pcall(function()
local g=game w=g.Workspace l=g.Lighting t=w.Terrain u=g:GetService("RunService")
u:Set3dRenderingEnabled(false) UserSettings():GetService("UserGameSettings").MasterVolume=0
sethiddenproperty(l,"Technology",2) sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize,t.WaterWaveSpeed,t.WaterReflectance,t.WaterTransparency=0,0,0,0
l.GlobalShadows,l.FogEnd,l.Brightness=0,9e9,0 settings().Rendering.QualityLevel="Level01"
local d=true
for _,v in pairs(w:GetDescendants()) do local c=v.ClassName
	if v:IsA("BasePart") and not v:IsA("MeshPart") or (v:IsA("MeshPart") and d) then
		v.Material="Plastic" v.Reflectance=0 if c=="MeshPart" then v.TextureID=10385902758728957 end
	elseif (c=="Decal" or c=="Texture") and d then v.Transparency=1
	elseif c=="ParticleEmitter" or c=="Trail" then v.Lifetime=NumberRange.new(0)
	elseif c=="Explosion" then v.BlastPressure,v.BlastRadius=1,1
	elseif c=="Fire" or c=="SpotLight" or c=="Smoke" or c=="Sparkles" then v.Enabled=false
	elseif c=="SpecialMesh" and d then v.TextureId=0
	elseif c=="ShirtGraphic" and d then v.Graphic=1
	elseif (c=="Shirt" or c=="Pants") and d then v[c.."Template"]=1
	end
end

for _,e in pairs(l:GetChildren()) do
	local c=e.ClassName
	if c=="BlurEffect" or c=="SunRaysEffect" or c=="ColorCorrectionEffect" or c=="BloomEffect" or c=="DepthOfFieldEffect" then
		e.Enabled=false
	end
end

w.DescendantAdded:Connect(function(v) local c=v.ClassName
	if v:IsA("BasePart") and not v:IsA("MeshPart") or (v:IsA("MeshPart") and d) then
		v.Material="Plastic" v.Reflectance=0 if c=="MeshPart" then v.TextureID=10385902758728957 end
	elseif (c=="Decal" or c=="Texture") and d then v.Transparency=1
	elseif c=="ParticleEmitter" or c=="Trail" then v.Lifetime=NumberRange.new(0)
	elseif c=="Explosion" then v.BlastPressure,v.BlastRadius=1,1
	elseif c=="Fire" or c=="SpotLight" or c=="Smoke" or c=="Sparkles" then v.Enabled=false
	elseif c=="SpecialMesh" and d then v.TextureId=0
	elseif c=="ShirtGraphic" and d then v.Graphic=1
	elseif (c=="Shirt" or c=="Pants") and d then v[c.."Template"]=1
	end
end)
end) end)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))) end)
