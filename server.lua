RegisterServerEvent('duty:confirmDuty')
AddEventHandler('duty:confirmDuty', function(department, name, callsign)
    local src = source
    print("Received duty confirmation from player: " .. tostring(src)) -- Debugging
    print("Department: " .. department .. ", Name: " .. name .. ", Callsign: " .. callsign) -- Debugging

    -- Send confirmation back to the client
    TriggerClientEvent('duty:confirmDuty', src, department, name, callsign)
end)
