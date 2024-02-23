_G.AutoVote = true 
_G.Difficulty = "Nightmare" -- "Easy" / "Medium" / "Hard" / "Nightmare" 
loadstring(game:HttpGet("https://raw.githubusercontent.com/CodexHubX/e32cqvvx3dz486221wwdac/main/TTDAutoVote.lua"))()
shared.Config = {
    KaitanMode = {
        ["Enabled"] = false,
    },
    Webhooks = {
        ["Enabled"] = true,
        ["URL"] = "https://discord.com/api/webhooks/1210518410627129374/5wDqyqhfUx72IgGNyUq028p6RkWIBOpA38C9toW5SNTxMdTPrF-9zOeqDjLKEx3oVXI9",
    },
    Settings = {
        ["Select World"] = "ToiletCity",
        ['Vote Difficulty'] = 'Nightmare',
        ['Auto Replay'] = true,
        ['Auto Skip Wave'] = true,
        ['FPS Booster'] = true,
        ['White Screen Mode'] = false,
        ['Hide Name'] = true,
    },
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/Xenon-Trash/Loader/main/Loader.lua')){219206403627}
