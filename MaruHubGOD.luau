repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
_G.Team = "Pirate" -- Marine / Pirate
getgenv().Key = "MARU-XUV1V-I01J-CNQ2P-IZI1-A9NNW"
getgenv().id = "1139083335713439784"
getgenv().Script_Mode = "Kaitun_Script"
_G.MainSettings = {
    ["EnabledHOP"] = true,
    ['FPSBOOST'] = true,
    ["FPSLOCKAMOUNT"] = 15,
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
task.spawn(function()
    while not Loaded and task.wait(5) do
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
        end)
    end
end)
