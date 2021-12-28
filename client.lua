RegisterNetEvent("vehwipe:client:delallveh")
AddEventHandler("vehwipe:client:delallveh", function ()
        local vehicles = GetGamePool('CVehicle')
    for i=1, #vehicles, 1 do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicles[i], -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicles[i], false) 
            SetEntityAsMissionEntity(vehicles[i], false, false) 
            DeleteVehicle(vehicles[i])
            if (DoesEntityExist(vehicles[i])) then 
                DeleteVehicle(vehicles[i]) 
            end
        end
    end
end)
