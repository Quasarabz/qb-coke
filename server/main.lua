QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("coke_brick", function(source, item)
    TriggerEvent("qb-drugs:usecokebrick", source)
end)

RegisterNetEvent('qb-drugs:usecokebrick', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = 1000
    if Player.Functions.GetItemByName("empty_weed_bag") then
        if Player.Functions.GetItemByName("weapon_knife") then
            TriggerClientEvent('QBCore:Notify', source,'You are cuttin the brick..', 'success')
            Wait(4000)
            Player.Functions.AddItem("premiumcokebaggy", amount)
            TriggerClientEvent('QBCore:Notify', source, 'You succesfully cut the brick..', 'success')
            Player.Functions.RemoveItem("coke_brick", 1)
            Player.Functions.RemoveItem("empty_weed_bag", 1)
        else
            TriggerClientEvent('QBCore:Notify', source,'You need a knife to cut the brick.', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source,'You need baggies for this.', 'error')
    end
end)

QBCore.Functions.CreateUseableItem("coke_small_brick", function(source, item)
    TriggerEvent("qb-drugs:usesmallcokebrick", source)
end)

RegisterNetEvent('qb-drugs:usesmallcokebrick', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = 100
    if Player.Functions.GetItemByName("empty_weed_bag") then
        if Player.Functions.GetItemByName("weapon_knife") then
            TriggerClientEvent('QBCore:Notify', source,'You are cuttin the brick..', 'success')
            Wait(4000)
            Player.Functions.AddItem("premiumcokebaggy", amount)
            TriggerClientEvent('QBCore:Notify', source, 'You succesfully cut the brick..', 'success')
            Player.Functions.RemoveItem("coke_small_brick", 1)
            Player.Functions.RemoveItem("empty_weed_bag", 1)
        else
            TriggerClientEvent('QBCore:Notify', source,'You need a knife to cut the brick.', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source,'You need baggies for this.', 'error')
    end
end)


QBCore.Functions.CreateCallback(Config.FolderName..':server:get:ingredient', function(source, cb, items)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local items = items
    local hasItems = true
    for k, v in pairs(items) do
        if Ply.Functions.GetItemByName(items[k].itemName) ~= nil then
            hasItems = hasItems and (Ply.Functions.GetItemByName(items[k].itemName).amount >= items[k].amount)
        else
            hasItems = hasItems and false 
        end
    end
    cb(hasItems)
end)

RegisterNetEvent(Config.FolderName..":server:cook")
AddEventHandler(Config.FolderName..":server:cook", function(items, giveitem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    removedItems = {}
    local removed = true
    for k, v in pairs(items) do
        if Player.Functions.RemoveItem(items[k].itemName, items[k].amount) then
            table.insert(removedItems, {item = items[k].itemName, amount = items[k].amount})
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[v.itemName], "remove")
            removed = removed and true
        else
            removed = removed and false
        end
    end

    if removed then
        Player.Functions.AddItem(giveitem, 1)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[giveitem], "add")
    else
        for k, v in pairs(removedItems) do
            Player.Functions.AddItem(v.item, v.amount)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[v.item], "add")
        end
        TriggerClientEvent('QBCore:Notify', source, "Looks like you dropped some items!", "error")
    end
end)
