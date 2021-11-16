RegisterCommand('veh', function(source, args, rawCommand)

    local vehicle = args[1]
    local x,y,z = table.unpack(GetOffsetFromInteriorInWorldCoords(PlayerPedId(), 0.0, 2.5, 0.5)
    vehiclehash = GetHashKey(vehicle)
    RequestModel(vehiclehash)

    Citizen.CreateThread(funtion()

        while not HasModelLoaded(vehiclehash) do
            Citizen.Wait(10)
        end

        local spawnedvehicle = CreateVehicle(vehiclehash, x, y z, GetEntityHeading(PlayerPedId()+90, 1, 0))
        SetVehicleNumberPlateText(spawnedvehicle, "Reezy#9495")
        Notify("~g~Fahrzeug wurde erstellt")
    end)

end)

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(msg)
    DrawNotification(false, false)
end