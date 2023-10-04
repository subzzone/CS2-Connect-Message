--[[
******************************************************[ CONNECT MESSAGE CS2 ]********************************************************
	Plugin created by: Alexelmanco
	Github: https://github.com/subzzone
	Discord: Alexelmanco#7184
	Steam: https://steamcommunity.com/id/alexelmanco/
	________________________________________________________________________
	USABILITY:
	- This plugin is a simple Connect Message to the server
************************************************************************************************************************************
--]]

-- Imports
local config = require("connect-message.cfg.cmconfig")
local language = require("connect-message.cfg.cmlanguages")

-- Simple print
print("[CONNECT MESSAGE] THE SCRIPT IS ON")

-- Remove duplicated listeners upon manual reload
if tListenerIds then
    for k, v in ipairs(tListenerIds) do
        StopListeningToGameEvent(v)
    end
end

-- Global variables
local count = 1
local usersId = {} -- User id array
local usersIsBot = {} -- User bool bot

-- Function to handle player connection
function OnPlayerPutInServer(event)
    -- User Variables
    local useridConnect = event.userid
    local nameConnect = event.name
    local isBot = event.bot

    -- IsBot saver
    usersId[count] = useridConnect
    usersIsBot[count] = isBot
    count = count + 1

    -- Print message
    if isBot == 1 then
        if config.botNotification then
            ScriptPrintMessageChatAll("\x04 \x04 [ " .. config.nameTag .. " ] " .. language[config.language][1] .. "\x08 \x08" .. nameConnect .. "\x04 \x04 " .. language[config.language][4])
        end
    else
        ScriptPrintMessageChatAll("\x04 \x04 [ " .. config.nameTag .. " ] " .. language[config.language][2] .. "\x08 \x08" .. nameConnect .. "\x04 \x04 " .. language[config.language][4])
    end
end

-- Function to handle player disconnection
function OnPlayerDisconnect(event)
    -- User Variables
    local useridDisconnect = event.userid
    local nameDisconnect = event.name
    local isBot = 0

    -- Loop to find the user id and add isBot
    for i = 1, #usersId do
        if usersId[i] == useridDisconnect then
            isBot = usersIsBot[i]
            break
        end
    end

    -- Print message
    if isBot == 1 then
        if config.botNotification then
            ScriptPrintMessageChatAll("\x04 \x04 [ " .. config.nameTag .. " ] " .. language[config.language][1] .. "\x08 \x08" .. nameDisconnect .. "\x04 \x04 " .. language[config.language][3])
        end
    else
        ScriptPrintMessageChatAll("\x04 \x04 [ " .. config.nameTag .. " ] " .. language[config.language][2] .. "\x08 \x08" .. nameDisconnect .. "\x04 \x04 " .. language[config.language][3])
    end
end

-- tListenerIds
tListenerIds = {
    ListenToGameEvent("player_connect", OnPlayerPutInServer, nil),
    ListenToGameEvent("player_disconnect", OnPlayerDisconnect, nil),
}
