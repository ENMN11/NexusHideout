repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
task.spawn(function()local a=tostring(game.Players.LocalPlayer.UserId)..".main"while true do pcall(function()if isfile(a)then delfile(a)end; local s=false while not s do s,_=pcall(function()writefile(a,"https://discord.gg/FcEGmkNDDe")end) or task.wait(1)end end) task.wait(10) end end)
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
getgenv().ConfigsKaitun = {
	Beta_Fix_Data_Sync = true,
        NoDeletePlayer = false,
	["Block Pet Gift"] = true,
        Collect_Cooldown = 120,
	["Low Cpu"] = true,
	["Auto Rejoin"] = true,
	["Rejoin When Update"] = true,
	["Limit Tree"] = {
		["Limit"] = 250,
		["Destroy Untill"] = 200,
		["Safe Tree"] = {
                        "Maple Apple",
			"Moon Blossom",
			"Fossilight",
                        "Candy Blossom",
                        "Bone Blossom", 
                        "Feijoa",
                        "Loquat",
                        "Pitcher Plant",
                        "Traveler's Fruit",
                        "Pepper",
                        "Hive Fruit",
                        "Nectarine",
                        "Serenity",
                        "Sunflower",
                        "Dragon Pepper",
                        "Elephant Ears",
                        "Soft Sunshine",
		}
	},
	Seed = {
		Buy = {
			Mode = "Auto", -- Custom , Auto
			Custom = {
				"Carrot",
				"Bamboo",
				"Pumpkin",
				"Daffodil",
				"Orange Tulip",
				"Watermelon",
				"Mushroom",
				"Avocado",
				"Feijoa",
				"Cauliflower",
				"Loquat",
				"Green Apple",
				"Nightshade",
				"Firefly Fern",
				"Soft Sunshine",
				"Zen Rocks",
				"Hinomai",
				"Beanstalk",
				"Ember Lily",
				"Sunflower",
				"Sugar Apple",
				"Burning Bud",
				"Giant Pinecone",
				"Spiked Mango",
			}
		},
		Place = {
			Mode = "Lock", -- Select , Lock
			Select = {
				"Carrot"
			},
			Lock = {
                                -- No
			}
		}
	},
	["Seed Pack"] = {
		Locked = {
		}
	},

	Events = {
		["Bean Event"] = {
			Minimum_Money = 100000000, -- minimum money to start play this event
		},
		Shop = {
			"Sprout Seed Pack",
			"Sprout Egg",
			"Silver Fertilizer",
			"Canary Melon",
			"Amberheart",
			"Spriggan",
		},
		["Traveling Shop"] = {
			"",
		},
		Craft = {
			"",
		},
		Start_Do_Honey = 2_000_000 -- start trade fruit for honey at money
	},

	Gear = {
		Buy = { 
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
			"Level Up Lollipop",
			"Medium Treat",
			"Medium Toy",
		},
		Lock = {
			"Master Sprinkler",
			"Godly Sprinkler",
			"Advanced Sprinkler",
			"Basic Sprinkler",
			"Lightning Rod",
		},
	},

	Eggs = {
		Place = {
			"Bug Egg",
			"Paradise Egg",
			"Mythical Egg",
                        "Gourmet Egg",
		},
		Buy = {
			"Bug Egg",
			"Paradise Egg",
			"Mythical Egg",
                        "Gourmet Egg",
		}
	},

	Pets = {
		["Start Delete Pet At"] = 40,
		["Upgrade Slot"] = {
			["Pet"] = {
				["Sunny-Side Chicken"] = { 1, 100, 1, true },
                                ["Sushi Bear"] = { 1, 100, 2, true },
                                ["Gorilla Chef"] = { 1, 100, 3, true },
                                ["Spaghetti Sloth"] = { 1, 100, 4, true },

			},
			["Limit Upgrade"] = 8,
			["Equip When Done"] = {
				["Sunny-Side Chicken"] = { 1, 100, 1 },
				["Sushi Bear"] = { 1, 100, 2 },
				["Gorilla Chef"] = { 1, 100, 3 },
				["Spaghetti Sloth"] = { 1, 100, 4 },
			},
		},
                Unfavorite_AllPet = true,
		Favorite_LockedPet = false,
		Locked_Pet_Age = 999, 
		Locked = {
               		["Sunny-Side Chicken"] = 1,
			["Sushi Bear"] = 1,
			["Gorilla Chef"] = 1,
		        ["Spaghetti Sloth"] = 1,
                        "Lobster Thermidor",
                        "French Fry Ferret",
			"Kitsune", 
                        "Butterfly", 
                        "Dragonfly", 
                        "Mimic Octopus", 
                        "Disco Bee", 
                        "Butterfly", 
                        "Moon Cat", 
                        "Red Fox",   
                        "T-Rex", 
                        "Spinosaurus", 
                        "Dilophosaurus", 
                        "Raccoon",
		},
		LockPet_Weight = 999,
		Ignore_Pet_Weight = {
			"",
		},
		Instant_Sell = {		
                        "",
		}
	},

	Webhook = {
		UrlPet = "",
		UrlSeed = "",
		PcName = "",
		Noti = {
			Seeds = {
				"Sunflower",
				"Dragon Pepper",
				"Elephant Ears",
			},
			SeedPack = {
				"Idk"
			},
			Pets = {
				"Lobster Thermidor",
                "French Fry Ferret",
                "Corrupted Kitsune",
                "Raiju",
                "Kitsune",
                "Dilophosaurus",
                "Moon Cat",
                "Spinosaurus",
                "T-Rex",
                "Brontosaurus",
                "Disco Bee",
                "Butterfly",
                "Queen Bee",
                "Dragonfly",
                "Raccoon",
                "Fennec Fox",
                "Mimic Octopus",
                "Red Fox",
			},
			Pet_Weight_Noti = true,
		}
	},
}
License = "H5OjLSSiXj8TLWm8hF9HAUkP6JkUjIoL"
while true do
    local a = pcall(function()
        loadstring(game:HttpGet("https://api.realaya.xyz/v1/files/l/98vt13x1h979yxngcvxbkjsq8hsw9rpw.lua"))()
    end)
    if a then
        task.spawn(function()
            local t = os.clock()
            while os.clock() - t < 300 do
                setfpscap(2)
                task.wait(2)
            end
        end)
        break
    else
        task.wait(5)
    end
end

