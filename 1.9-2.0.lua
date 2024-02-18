_G.KAITUN_KL_MODE = true
_G.Settings_Farm = {
    ["Start_Farm"] = true,
    ["Enabled_HOP"] = true,
    ["Fruits_List"] = {
        'PhoenixPhoenix',
        'DoughDough',
        'DragonDragon'
    },
    ["Enabled_Invisible"] = false,
    ["Enabled_FastFarm"] = true,
    ["Amount_FPS"] = 15,
    ["LOCK_FPS"] = true,
    ["WhiteScreen"] = true,
    ["Disabled_Gui"] = true,
}
_G.Quests_Settings = {
     ["V2Observation"] = false,
     ["V2Aramament"] = false,
     ["V2DarkLeg"] = false,
     ["FarmRaid"] = false
}

getgenv().Key = "MARU-A2HJ-9H4UR-F7FG-WINSF-DQC8"
getgenv().id = "1200480542563508367"
getgenv().Script_Mode = "Kaitun_Script"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
