local playerCount = 1;
local serverUptime = 0;
local myuptime = 0;
RegisterNetEvent('NAT2K15:DISCORDRICHPRESENCE:UPDATE')
AddEventHandler('NAT2K15:DISCORDRICHPRESENCE:UPDATE', function(count, uptime)
    playerCount = count
    serverUptime = uptime
end)

Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(config.clientid)
        SetDiscordRichPresenceAsset(config.icons.big.icon)
        SetDiscordRichPresenceAssetText(fixMessage(config.icons.big.text))
        SetDiscordRichPresenceAssetSmall(config.icons.small.icon)
        SetDiscordRichPresenceAssetSmallText(fixMessage(config.icons.small.text))
        if config.messages.rotateMessages.enabled then
            local message = config.messages.rotateMessages.messages[math.random(1, #config.messages.rotateMessages.messages)]
            SetRichPresence(fixMessage(message))
        else
            SetRichPresence(fixMessage(config.messages.startingMessage))
        end
        if config.discordButtons.enabled then
            SetDiscordRichPresenceAction(0, config.discordButtons.buttons[1].label, config.discordButtons.buttons[1].url)
            if(config.discordButtons.buttons[1].enabled) then
                SetDiscordRichPresenceAction(1, config.discordButtons.buttons[2].label, config.discordButtons.buttons[2].url)
            end
        end
        Citizen.Wait(5000)
    end
end)

function fixMessage(message)
    local messages = {
        ["{count}"] = playerCount,
        ["{name}"] = GetPlayerName(PlayerId()),
        ["{id}"] = GetPlayerServerId(PlayerId()),
        ["{uptime}"] = secondsToClock(myuptime),
        ["{serveruptime}"] = secondsToClock(serverUptime),
    }
    for k, v in pairs(messages) do
        message = message:gsub(k, v)
    end
    return message
end

function secondsToClock(seconds)
    local seconds = tonumber(seconds)
    if seconds <= 0 then
        return "00:00:00";
    else
        local hours = string.format("%02.f", math.floor(seconds / 3600));
        local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)));
        local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60));
        return hours..":"..mins..":"..secs
    end
end

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(1000) 
        myuptime = myuptime + 1
    end
end)