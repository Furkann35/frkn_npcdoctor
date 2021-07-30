

ESX = nil
firstspawn = false
tedavi = false
paramvartedavioluyomkardes = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do 
        player = PlayerPedId()
        plyCoords = GetEntityCoords(player)
        Citizen.Wait(3500)
    end
end)
    

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

doktorcoords = {
    vector3(2484.01, 4959.8, 44.86)
}
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        for k in pairs(doktorcoords) do
           local plyCoords  = GetEntityCoords(player)

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, doktorcoords[k].x, doktorcoords[k].y, doktorcoords[k].z)
            if dist <= 2 then        
                sleep = 5
                frkntext3d(2484.01, 4959.8, 44.86 + 0.12, Config.Text)
            end
            if dist <= 3 then
                if IsControlJustPressed(0, 38) then
    
                    ESX.TriggerServerCallback('frkn_npcdoktorv2:doktorvarmı',function(online)
                        if online >=1 then
                           exports['mythic_notify']:DoHudText('error', "Şehirde doktor varken ben çalışmam!")
                        else
                    Citizen.Wait(1)   
                    ESX.TriggerServerCallback('frkn:parakontrol',function(paravarmi)
                  
            end) 
                end	 
            end)
        end
            end
        end
        Citizen.Wait(sleep)
    end
end)


RegisterNetEvent('frkn_npcdoktorv2:tedavi')
AddEventHandler('frkn_npcdoktorv2:tedavi', function()
    DoScreenFadeOut(1000)
    SetEntityInvincible(player, true)
    exports["frkn-taskbar"]:taskBar(5000,"Tedaviye götürülüyorsun :)")
    Citizen.Wait(5000)
    DoScreenFadeIn(1000)
    SetEntityCoords(player,-901.52, -375.63, 78.27, false)
    SetEntityHeading(player, 281.8)
    tedavi = true
    if not IsEntityPlayingAnim(player, "rcmpaparazzo_2", "shag_loop_poppy", 3) then
        TaskPlayAnim(player, "rcmpaparazzo_2", "shag_loop_poppy", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
    end 
    FreezeEntityPosition(player, true)
    exports["frkn-taskbar"]:taskBar(Config.SexDoctorAnimTime,"Tedavi ediliyorsun :)")
    tedavi = false
    DoScreenFadeOut(500)
    Citizen.Wait(5000)
    DoScreenFadeIn(500)
    FreezeEntityPosition(player, false)
    ClearPedTasksImmediately(player)
    SetEntityCoords(player, 2484.01, 4959.8, 44.86, false)
    SetEntityHeading(player, 342.71)
    SetEntityInvincible(player, false)
    loadAnimDict('anim@gangops@morgue@table@')
    if not IsEntityPlayingAnim(player, "anim@gangops@morgue@table@", "body_search", 3) then
        TaskPlayAnim(player, "anim@gangops@morgue@table@", "body_search", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
    end 
    TriggerEvent('esx_ambulancejob:revive')
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
    TriggerServerEvent('reload_death:revive', GetPlayerServerId(closestPlayer))
    TriggerServerEvent('reload_death:setDead', false)
end)







Citizen.CreateThread(function()
    local hash2 = GetHashKey("s_m_m_doctor_01")
    if not HasModelLoaded(hash2) then
        RequestModel(hash2)
        Citizen.Wait(3500)
    end
    while not HasModelLoaded(hash2) do
        Citizen.Wait(3500)
    end
    if not firstspawn then
        local sapikdoktor = CreatePed(6, hash2, -905.45, -374.06, 78.27, 111.64, true, false)
		SetBlockingOfNonTemporaryEvents(sapikdoktor, true)
        SetPedDiesWhenInjured(sapikdoktor, true)
        SetPedCanRagdollFromPlayerImpact(sapikdoktor, true)
        SetPedCanRagdoll(sapikdoktor, true)
        FreezeEntityPosition(sapikdoktor, true)
        loadAnimDict('amb@world_human_leaning@female@wall@back@hand_up@idle_a')
        if not IsEntityPlayingAnim(sapikdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 3) then
            TaskPlayAnim(sapikdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
        end
        Citizen.CreateThread(function()
            while true do 
                Citizen.Wait(0)
                if tedavi then 
                    Citizen.Wait(100)
                    ClearPedTasksImmediately(sapikdoktor)
                    FreezeEntityPosition(sapikdoktor, false)
                    Citizen.Wait(50)
                    TaskGoStraightToCoord(sapikdoktor, -904.53, -376.3, 79.27, 20, -1, 280.61, 0)
                    Citizen.Wait(3000)
                    TaskGoStraightToCoord(sapikdoktor, -901.91, -375.85, 79.27, 20, -1, 281.8, 0)
                    Citizen.Wait(4500)
                    loadAnimDict(Config.SexDoctorAnim1)
                    if not IsEntityPlayingAnim(sapikdoktor,Config.SexDoctorAnim1,Config.SexDoctorAnim2, 3) then
                        TaskPlayAnim(sapikdoktor, Config.SexDoctorAnim1, Config.SexDoctorAnim2, 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                    end 
                    Citizen.Wait(Config.SexDoctorAnimTime)
                   ClearPedTasksImmediately(sapikdoktor)
                    Citizen.Wait(50)
                    TaskGoStraightToCoord(sapikdoktor, -904.73, -376.59, 79.27, 20, -1, 23.13, 0)
                    Citizen.Wait(3200)
                    TaskGoStraightToCoord(sapikdoktor, -905.94, -373.06, 79.27, 20, -1,  111.64, 0)
                    Citizen.Wait(5500)
                    loadAnimDict('amb@world_human_leaning@female@wall@back@hand_up@idle_a')
                    if not IsEntityPlayingAnim(sapikdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 3) then
                        TaskPlayAnim(sapikdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                    end
                    tedavi = false
                end
            end
        end)
    end
end)







RegisterNetEvent('frknnpcdoktorv2:paramvar')
AddEventHandler('frknnpcdoktorv2:paramvar', function()
    DoScreenFadeOut(1000)
    SetEntityInvincible(player, true)
    exports["frkn-taskbar"]:taskBar(5000,"Tedaviye götürülüyorsun")
    Citizen.Wait(5000)
    DoScreenFadeIn(1000)
    SetEntityCoords(player, 255.79, -1352.26, 24.52, false)
    SetEntityHeading(player, 135.56)
    paramvartedavioluyomkardes = true
    loadAnimDict('anim@gangops@morgue@table@')
    if not IsEntityPlayingAnim(player, "anim@gangops@morgue@table@", "body_search", 3) then
        TaskPlayAnim(player, "anim@gangops@morgue@table@", "body_search", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
    end 
    FreezeEntityPosition(player, true)
    exports["frkn-taskbar"]:taskBar(Config.MoneyDoctorAnimTime,"Tedavi ediliyorsun")
    paramvartedavioluyomkardes = false
    DoScreenFadeOut(500)
    Citizen.Wait(5000)
    DoScreenFadeIn(500)
    FreezeEntityPosition(player, false)
    ClearPedTasksImmediately(player)
    SetEntityCoords(player, 2484.01, 4959.8, 43.86, false)
    SetEntityHeading(player, 342.71)
    SetEntityInvincible(player, false)
    loadAnimDict('anim@gangops@morgue@table@')
    if not IsEntityPlayingAnim(player, "anim@gangops@morgue@table@", "body_search", 3) then
        TaskPlayAnim(player, "anim@gangops@morgue@table@", "body_search", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
    end 
    TriggerEvent('esx_ambulancejob:revive')
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
    TriggerServerEvent('reload_death:revive', GetPlayerServerId(closestPlayer))
    TriggerServerEvent('reload_death:setDead', false)
end)


Citizen.CreateThread(function()
    local hash2 = GetHashKey("s_m_m_doctor_01")
    if not HasModelLoaded(hash2) then
        RequestModel(hash2)
        Citizen.Wait(3500)
    end
    while not HasModelLoaded(hash2) do
        Citizen.Wait(3500)
    end
    if not firstspawn then
        local adamdoktor = CreatePed(6, hash2, 255.06, -1351.78, 23.55, 229.64, true, false)
		SetBlockingOfNonTemporaryEvents(adamdoktor, true)
        SetPedDiesWhenInjured(adamdoktor, true)
        SetPedCanRagdollFromPlayerImpact(adamdoktor, true)
        SetPedCanRagdoll(adamdoktor, true)
        FreezeEntityPosition(adamdoktor, true)
        loadAnimDict('amb@world_human_leaning@female@wall@back@hand_up@idle_a')
        if not IsEntityPlayingAnim(adamdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 3) then
            TaskPlayAnim(adamdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
        end
        Citizen.CreateThread(function()
            while true do 
                Citizen.Wait(0)
                if paramvartedavioluyomkardes then 
                    Citizen.Wait(100)
                    ClearPedTasksImmediately(adamdoktor)
                    FreezeEntityPosition(adamdoktor, false)
                    Citizen.Wait(50)
                    loadAnimDict(Config.MoneyDoctorAnim1)
                    if not IsEntityPlayingAnim(adamdoktor, Config.MoneyDoctorAnim1, Config.MoneyDoctorAnim2, 3) then
                        TaskPlayAnim(adamdoktor, Config.MoneyDoctorAnim1, Config.MoneyDoctorAnim2, 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                    end 
                    Citizen.Wait(Config.MoneyDoctorAnim1)  
                   ClearPedTasksImmediately(adamdoktor)
                    Citizen.Wait(50)
                    loadAnimDict('amb@world_human_leaning@female@wall@back@hand_up@idle_a')
                    if not IsEntityPlayingAnim(adamdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 3) then
                        TaskPlayAnim(adamdoktor, "amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                    end
                    paramvartedavioluyomkardes = false
                end
            end
        end)
    end
end)







Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_doctor_01")
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Citizen.Wait(3500)
    end
    while not HasModelLoaded(hash) do
        Citizen.Wait(3500)
    end
    if firstspawn == false then
        local frkn1npc = CreatePed(6, hash, 2484.01, 4959.8, 43.86, 222.01, true, false)
		SetBlockingOfNonTemporaryEvents(frkn1npc, true)
        SetPedDiesWhenInjured(frkn1npc, true)
        SetPedCanRagdollFromPlayerImpact(frkn1npc, true)
        SetPedCanRagdoll(frkn1npc, true)
        FreezeEntityPosition(frkn1npc, true)
        loadAnimDict('amb@world_human_hang_out_street@female_arms_crossed@idle_a')
        if not IsEntityPlayingAnim(frkn1npc, "amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", 3) then
            TaskPlayAnim(frkn1npc, "amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
        end 
    end
end)








function frkntext3d(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function loadAnimDict(dict)  
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(500)
    end
end 
