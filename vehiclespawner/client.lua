-- ESX Boilerplate

ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX = nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData();

end)

--Net Evnets
RegisterNetEvent('esx:playLoaded')
AddEventHandler('esx:playLoaded', function(xPlayer)
    PlayerData = xPlayer

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job

end)

local IsMenuOpen = false

function OpenMenu()

    IsMenuOpen = true

    FreezeEntityPosition(GetPlayerPed(-1), true)

    local options = {
        (label = "Spawn Fahrzeug", value="spawn_vehicle")

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
          title = "Fahrzeug Spawner",
          align = "top-left"  
          elemts = options
        }, function(data, menu)
            if data.current.value == 'spawn_vehicle' then
                vehiclehash = GetHashKey('Sultan')
                RequestModel(vehiclehash)
                while not HasModelLoaded(vehiclehash) do
                    Citizen.Wait(10)
                end
                local x,y,z = table.unpack(GetOffsetFromInteriorInWorldCoords(PlayerPedId, 0.0, 2.5, 0.5))
                local spawn_vehicle = CreateThread(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()+90, 1 , 0))

            }
        end
    end


end