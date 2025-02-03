-- Register the /duty command
RegisterCommand("duty", function()
    print("Opening duty menu...") -- Debugging

    -- One Menu: Select Duty Department, Name, and Callsign
    lib.inputDialog('Duty Selection', {
        {type = 'select', label = 'Choose your department', options = {
            {value = 'us_dhs', label = 'U.S. DHS'},
            {value = 'us cia', label = 'U.S. CIA'},
            {value = 'lapd', label = 'LAPD'},
            {value = 'lasd', label = 'LASD'},
            {value = 'bcso', label = 'BCSO'},
            -- Add more departments here if needed
        }},
        {type = 'input', label = 'Enter your name (e.g. Mike S.)'},
        {type = 'input', label = 'Enter your callsign (e.g. 1B-01 or 101)'}
    }, function(input)
        if not input then return end

        local department = input[1]
        local name = input[2]
        local callsign = input[3]

        print("Selected department: " .. department) -- Debugging
        print("Entered name: " .. name .. ", Entered callsign: " .. callsign) -- Debugging

        -- Send the information to the server to confirm duty status
        TriggerServerEvent('duty:confirmDuty', department, name, callsign)
    end)
end)

-- Handle the response from the server (confirmation of duty status)
RegisterNetEvent('duty:confirmDuty')
AddEventHandler('duty:confirmDuty', function(department, name, callsign)
    print("You are now on duty as " .. department .. " with callsign " .. callsign) -- Debugging

    -- Simple in-game message to confirm duty status
    TriggerEvent('chat:addMessage', {
        args = {'[Duty]', 'You are now on duty as ' .. department .. ' with callsign ' .. callsign}
    })
end)
