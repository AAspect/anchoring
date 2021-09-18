RegisterServerEvent('anchor:server:toggleState')
AddEventHandler('anchor:server:toggleState', function(veh)
    local ent = Entity(NetworkGetEntityFromNetworkId(veh))
    if ent.state.anchored == 'false' or ent.state.anchored == nil then
        TriggerClientEvent('client:toggleAnchor', -1, 'anchor', ent)
        ent.state.anchored = 'true' 
    else
        TriggerClientEvent('client:toggleAnchor', -1, 'unanchor', ent)
        ent.state.anchored = 'false'
    end
end)