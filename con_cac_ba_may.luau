repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))) end)
NEXUSHIDEOUT = 20
_G.Team = "Pirate"
getgenv().Key = "MARU-XUV1V-I01J-CNQ2P-IZI1-A9NNW"
getgenv().id = "1139083335713439784"
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 20,
    ['WhiteScreen'] = false,
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
game:GetService("RunService"):Set3dRenderingEnabled(false)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/main.lua"))) end)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/FPS%20Boost"))) end)
task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))) end)
