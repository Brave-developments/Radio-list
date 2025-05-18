local PMA = exports['pma-voice']
local CustomNames = {}
local CurrentResourceName = GetCurrentResourceName()

-- When someone disconnects, clear them from the radio list and optionally reset their custom name
AddEventHandler("playerDropped", function()
    local src = source
    local channel = Player(src).state.currentRadioChannel or 0

    -- notify everyone on that channel that src left
    local list = buildRadioList(channel)
    for _, p in pairs(list) do
        TriggerClientEvent("Brave-RadioList:Client:SyncRadioChannelPlayers", p.Source, src, 0, list)
    end

    if Config.LetPlayersSetTheirOwnNameInRadio and Config.ResetPlayersCustomizedNameOnExit then
        CustomNames[getIdentifier(src)] = nil
    end
end)

-- Hook PMA-voice’s radio-set event
RegisterNetEvent('pma-voice:setPlayerRadio')
AddEventHandler('pma-voice:setPlayerRadio', function(chStr)
    local src = source
    local newCh = tonumber(chStr)
    if not newCh then
        print(("radioChannelToJoin wasn’t a number, got %s"):format(type(chStr)))
        return
    end

    local oldCh = Player(src).state.currentRadioChannel or 0
    Player(src).state:set('currentRadioChannel', newCh, false)

    if oldCh > 0 then
        disconnect(src, oldCh)
    end
    if newCh > 0 then
        connect(src, oldCh, newCh)
    end
end)

function connect(src, oldCh, newCh)
    -- give PMA a moment
    Wait(1000)

    local list = buildRadioList(newCh)
    for _, p in pairs(list) do
        TriggerClientEvent("Brave-RadioList:Client:SyncRadioChannelPlayers", p.Source, src, newCh, list)
    end
end

function disconnect(src, ch)
    local list = buildRadioList(ch)

    -- tell src they’re off radio
    TriggerClientEvent("Brave-RadioList:Client:SyncRadioChannelPlayers", src, src, 0, list)

    -- tell everyone else on that channel
    for _, p in pairs(list) do
        TriggerClientEvent("Brave-RadioList:Client:SyncRadioChannelPlayers", p.Source, src, 0, list)
    end
end

-- build a table of { Source = playerId, Name = displayName }
function buildRadioList(channel)
    local raw = PMA:getPlayersInRadioChannel(channel)
    for pid in pairs(raw) do
        raw[pid] = {
            Source = pid,
            Name   = getDisplayName(pid)
        }
    end
    return raw
end

-- use custom name if set, otherwise GetPlayerName()
function getDisplayName(pid)
    if Config.LetPlayersSetTheirOwnNameInRadio then
        local id = getIdentifier(pid)
        if CustomNames[id] then
            return CustomNames[id]
        end
    end
    return GetPlayerName(pid)
end

-- command to let players rename themselves on the fly
if Config.LetPlayersSetTheirOwnNameInRadio then
    local cmdLen = #Config.RadioListChangeNameCommand
    local argStart = cmdLen + 2

    RegisterCommand(Config.RadioListChangeNameCommand, function(src, args, raw)
        local name = raw:sub(argStart)
        if src > 0 and name:match("%S") then
            CustomNames[getIdentifier(src)] = name
            -- refresh their current channel
            local ch = Player(src).state.currentRadioChannel or 0
            if ch > 0 then
                connect(src, ch, ch)
            end
        end
    end)
end

-- grab the player’s license identifier (fallback to playerid if none)
function getIdentifier(pid)
    for _, v in ipairs(GetPlayerIdentifiers(pid)) do
        if v:find("license:") then
            return v:gsub("license:", "")
        end
    end
    return tostring(pid)
end
