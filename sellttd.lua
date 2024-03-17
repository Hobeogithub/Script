shared.AutoSell = {
    HopSetting = {
        EverySecond = 10,
        MinPlayer = 600, --Max 65
    },
    ChatSetting = {
        Active = true,
        Delay = 15,
        List = {"Sell Patrick crate 20 gem in maket place", "Patrick crate 20 gem in market place"}
    },
    Unit = {
        ["St. Patrick's Day 2024 Crate"] = 20,
        ["Toxic Upgraded Titan Cameraman"] = 12345,
        ["Mace Cameraman"] = 6789,
        ["Shield Cameraman"] = 10111,
        ["Red Laser Cameraman"] = 99999,
    }
}

local plr = game.Players.LocalPlayer
local guiservice = game:GetService("GuiService")
local vim = game:GetService("VirtualInputManager")
local tps = game:GetService('TeleportService')

repeat wait() until game:IsLoaded()

if game.PlaceId == 13775256536 then
    while wait() do
        tps:Teleport(14682939953)
    end
end

wait(2)

function ableToSellUnit()
    for i, v in pairs(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList:GetChildren()) do
        if string.find(v.Name, "Row") and v.RowLocked.Visible == false then
            for e, g in pairs(v.Row:GetChildren()) do
                if string.find(g.Name, "Slot") and string.find(g.GemsFrame.BestPrice.Text, "n/a", 1, true)  then
                    return true
                end
            end
        end
    end
    return false
end

function ableToSellUnit2()
    local a, b = string.match(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.TotalUnitsForSale.UnitsForSaleDisplay.DisplayFrame.UnitsAmount.Text, "([^/]+)/([^/]+)")
    return tonumber(a) < tonumber(b)
end

function canSellThisUnit(name)
    for i, v in pairs(shared.AutoSell.Unit) do
        if string.find(i, name, 1, true) then
            return shared.AutoSell.Unit[i]
        end
    end
end

function clickGui(path)
    guiservice.SelectedObject = path
    wait(.1)
    vim:SendKeyEvent(true, 13, false, game)
    wait(.1)
    vim:SendKeyEvent(false, 13, false, game)
    wait(.1)
    guiservice.SelectedObject = nil
    wait(.1)
end

function writeGui(path, text)
    guiservice.SelectedObject = path
    wait(.1)
    path.Text = text
    wait(.1)
    vim:SendKeyEvent(true, 13, false, game)
    wait(.1)
    vim:SendKeyEvent(false, 13, false, game)
    wait(.1)
    guiservice.SelectedObject = nil
    wait(.1)
    path.Text = text
    wait(.1)
end

spawn(function()
    while wait() do
        if shared.AutoSell.ChatSetting.Active then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(shared.AutoSell.ChatSetting.List[math.random(1, #shared.AutoSell.ChatSetting.List)], "All")
            wait(shared.AutoSell.ChatSetting.Delay)
        end
    end
end)

spawn(function()
    while wait(shared.AutoSell.HopSetting.EverySecond) do
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= shared.AutoSell.HopSetting.MinPlayer then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if plr.PlayerGui.Lobby.MarketplaceFrame.Visible == false and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible == false then
                plr.Character.PrimaryPart.CFrame = CFrame.new(2114.790771484375, -1.386025309562683, 2119.912109375)
                wait(1)
                plr.Character.PrimaryPart.CFrame = CFrame.new(2131.40625, 1.373171329498291, 2140.538330078125)
            elseif plr.PlayerGui.Lobby.MarketplaceFrame.Visible and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible == false then
                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.TopBar.Sell.Button)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        if plr.PlayerGui.Lobby.MarketplaceFrame.Visible and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible then
            for i, v in pairs(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory:GetChildren()) do
                if v:IsA("Frame") and v.TroopPicture.CannotTrade.Visible == false and ableToSellUnit2() then
                    repeat wait()
                        clickGui(v.TroopPicture.InteractiveButton)
                    until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible
                    wait(.1)
                    local priceCheck = canSellThisUnit(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.UnitName.UnitName.Text)
                    if priceCheck then
                        repeat wait()
                            writeGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.MiddleMenu.PriceFrame.GemsFrame.TextBox, tostring(priceCheck))
                            clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.RightMenu.PutOnSale.SellButton)
                            clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.RightMenu.PutOnSale.SellButton)
                        until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible
                        wait(.1)
                        repeat wait()
                            clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Options.Confirm.ConfirmButton)
                        until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible == false
                        wait(.8)
                    else
                        repeat wait()
                            clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.CloseButton)
                        until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible == false
                    end
                end
            end
        end
    end
end)
