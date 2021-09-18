
RegisterCommand('anchor', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, true)
    local vehicleClass = GetVehicleClass(veh)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(ped)))
    if IsPedOnVehicle(ped) and vehicleClass == 14 and (model ~= "SUBMERS" and model ~= "SEASHARK" and model ~= "SEASHARK2" and model ~= "SEASHARK3" and model ~= "SUBMERS2") then
        TriggerServerEvent('anchor:server:toggleState', NetworkGetNetworkIdFromEntity(veh))
    end
end)

RegisterNetEvent('client:toggleAnchor', function(state, ent)
    local ped = PlayerPedId();
    local veh = GetVehiclePedIsIn(ped, true)
    local vehposition = GetEntityCoords(veh)
    -- ClearPedTasks(ped)
    if state == 'anchor' then    
        SetBoatAnchor(veh, true)
        SetBoatFrozenWhenAnchored(veh, true)
        TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)  
        Wait(1000)
        ClearPedTasks(ped)
        print("Successfully Anchored the Boat")
    elseif state == 'unanchor' then
        SetBoatFrozenWhenAnchored(veh, false)
        SetBoatAnchor(veh, false)
        print("Unanchoring")
        TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)  
        Wait(1000)
        ClearPedTasks(ped)
    end

end)


