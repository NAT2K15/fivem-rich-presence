local uptime = 0;
Citizen.CreateThread(function()
    TriggerClientEvent('NAT2K15:DISCORDRICHPRESENCE:UPDATE', -1, GetNumPlayerIndices(), uptime)
    while true do 
        Citizen.Wait(2000)
        uptime = uptime + 2
        TriggerClientEvent('NAT2K15:DISCORDRICHPRESENCE:UPDATE', -1, GetNumPlayerIndices(), uptime)
    end
end)

