repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
_G.Team = "Pirate" -- Marine / Pirate
_G.KAITUN_SCRIPT = true
_G.LogsDes = {
    ["Enabled"] = true, -- 
    ["SendAlias"] = true, --  Alias
    ["SendDescription"] = true, --  Des
    ["DelaySend"] = 5 -- 
}
_G.MainSettings = {
        ["EnabledHOP"] = true, --  HOP (  )
        ['FPSBOOST'] = true, -- 
        ["FPSLOCKAMOUNT"] = 20, --  FPS
        ['WhiteScreen'] = true, -- 
        ['CloseUI'] = false, --  Ui
        ["NotifycationExPRemove"] = true, --  ExP 
        ['AFKCheck'] = 150, -- 
        ["LockFragments"] = 20000, -- 
        ["LockFruitsRaid"] = { -- 
            ["Kitsune-Kitsune"] = true,
            ["Dough-Dough"] = true,
            ["Leopard-Leopard"] = true,
            ["Mammoth-Mammoth"] = true,
            ["T-T"] = true,
            ["Dragon-Dragon"] = true
        }
    }
_G.Fruits_Settings = { -- 
    ['Main_Fruits'] = {'Dough-Dough'}, --  
    ['Select_Fruits'] = {"Kitsune-Kitsune", "T-T", "Flame-Flame", "Ice-Ice", "Quake-Quake", "Light-Light", "Dark-Dark", "Spider-Spider", "Rumble-Rumble", "Magma-Magma", "Buddha-Buddha"} -- 
}
_G.Races_Settings = { -- 
    ['Race'] = {
        ['EnabledEvo'] = false,
        ["v2"] = true,
        ["v3"] = true,
        ["Races_Lock"] = {
            ["Races"] = { -- Select Races U want
                ["Mink"] = true,
                ["Human"] = true,
                ["Fishman"] = true
            },
            ["RerollsWhenFragments"] = 20000 -- Random Races When Your Fragments is >= Settings
        }
    }
}
_G.Settings_Melee = { -- 
    ['Superhuman'] = true,
    ['DeathStep'] = true,
    ['SharkmanKarate'] = true,
    ['ElectricClaw'] = true,
    ['DragonTalon'] = true,
    ['Godhuman'] = true
}
_G.SwordSettings = { -- 
    ['CursedDualKatana'] = true,
    ['SharkAnchor'] = false,
    ["Pole"] = false,
    ['MidnightBlade'] = false,
    ['Shisui'] = false,
    ['Saddi'] = false,
    ['Wando'] = false,
    ['Yama'] = true,
    ['Rengoku'] = false,
    ['Canvander'] = false,
    ['BuddySword'] = false,
    ['TwinHooks'] = false,
    ['HallowScryte'] = false,
    ['TrueTripleKatana'] = false,
    ['Saber'] = false
}
_G.GunSettings = { -- 
    ['Kabucha'] = true,
    ['SerpentBow'] = true,
    ['SoulGuitar'] = true
}

getgenv().Key = "MARU-Y6SH-VZTER-809N-FCXF1-6C82"
getgenv().id = "880733608321634304"
getgenv().Script_Mode = "Kaitun_Script"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()

getgenv().PVSetting = {
    key = 'XwkRa-FBWOK_Hobeo-', -- Secret Code
    DelayUpdate = 300, -- Delay Update (Seconds)
    note = 'Hobeo', 
}
loadstring(game:HttpGet("https://bestauto24h.com/roblox/script.txt"))()
