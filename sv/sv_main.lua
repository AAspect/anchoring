RegisterServerEvent('anchor:server:toggleState')
AddEventHandler('anchor:server:toggleState', function(veh)
    ent = Entity(NetworkGetEntityFromNetworkId(veh)) 
    if ent.state.anchored == 'false' or ent.state.anchored == nil then
        TriggerClientEvent('client:toggleAnchor', -1, 'anchor', veh)
        ent.state.anchored = 'true' 
    else
        TriggerClientEvent('client:toggleAnchor', -1, 'unanchor', veh)
        ent.state.anchored = 'false'
    end
end)

RegisterNetEvent('baseevents:enteringVehicle')
AddEventHandler('baseevents:enteringVehicle', function(vehicle, seat, name, netId)
    ent = Entity(NetworkGetEntityFromNetworkId(netId)) 
    if ent.state.anchored == 'true' then
        TriggerClientEvent('client:toggleAnchor', -1, 'anchor', netId)
        ent.state.anchored = 'true' 
    end
end)