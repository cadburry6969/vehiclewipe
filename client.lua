local function CheckAndDeleteVehicle(vehicle)
    if DoesEntityExist(vehicle) then
        if (GetVehicleNumberOfPassengers(vehicle) == 0) and IsVehicleSeatFree(Vehicle, -1) then
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteEntity(vehicle)
        end
    end
end

local function DeleteVehicleLoop()
    local vehPool = GetGamePool('CVehicle')
    for i = 1, #vehPool do
        CheckAndDeleteVehicle(vehPool[i])
    end
    SetTimeout(20000, DeleteVehicleLoop)
end

DeleteVehicleLoop()

AddEventHandler("baseevents:leftVehicle", function(curVeh, curSeat, vehName)
    if curSeat == -1 then
        CheckAndDeleteVehicle(curVeh)
    end
end)

RegisterNetEvent("vehiclewipe:delallveh", function ()
    local vehicles = GetGamePool('CVehicle')
    for i=1, #vehicles, 1 do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicles[i], -1))) then 
            CheckAndDeleteVehicle(vehicles[i])
        end
    end
end)
