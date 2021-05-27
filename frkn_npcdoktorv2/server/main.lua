ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterServerCallback('frkn_npcdoktorv2:doktorvarmı', function(source, cb)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local cops = 0

    for i = 1, #xPlayers, 1 do

        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'ambulance' then
            cops = cops + 1
        end
    end
    Wait(25)
    cb(cops)
end)


ESX.RegisterServerCallback('frkn:parakontrol', function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
    if(xPlayer.getMoney() >= Config.Money) then
		xPlayer.removeMoney(Config.Money)
        TriggerClientEvent("frknnpcdoktorv2:paramvar",source)
    else
        TriggerClientEvent('frkn_npcdoktorv2:tedavi', source)
    end
end)