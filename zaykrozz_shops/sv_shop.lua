ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--- Nourritures

RegisterNetEvent('buyPain')
AddEventHandler('buyPain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bread', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Pain ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

--- Boissons

RegisterNetEvent('buyEau')
AddEventHandler('buyEau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('water', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Eau ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)

RegisterNetEvent('buyIceTea')
AddEventHandler('buyIceTea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 35
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('icetea', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x IceTea ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)

--- Divers

RegisterNetEvent('BuySim')
AddEventHandler('BuySim', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 150
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('vpn', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Carte SIM ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)

RegisterNetEvent('BuyRadio')
AddEventHandler('BuyRadio', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 300
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('radio', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ acheter ~b~1 Radio (F10 Pour l'ouvrir) ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)

RegisterNetEvent('BuyPhone')
AddEventHandler('BuyPhone', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 800
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('tel', 1)
         TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ acheter ~b~1 Téléphone ~w~ pour ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)