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

-- Global variables --------------------
local count = 1;
local usersId = {} --User id array
local usersIsAnBot = {} -- User bool bot

function OnPlayerPutInServer(event)

	-- User Variables -------------------
	local useridConnect = event.userid;
	local nameConnect = event.name
	local isAnBot = event.bot;

	-- IsAnBot saver --------------------
	usersId[count] = useridConnect;
	usersIsAnBot[count] = isAnBot;
	count = count + 1

	-- Print message --------------------
	if (isAnBot == 1) then
		ScriptPrintMessageChatAll("\x04 \x04 [Server] Bot \x08 \x08" .. nameConnect .. "\x04 \x04 connected.");
	else
		ScriptPrintMessageChatAll("\x04 \x04 [Server] User \x08 \x08" .. nameConnect .. "\x04 \x04 connected.");
	end

end

function OnPlayerDisconnect(event)

	-- User Variables -------------------
	local useridDisconnect = event.userid;
	local nameDisconnect = event.name;
	local isAnBot = 0;

	-- Loop to find the user id and add isAnBot--
	for i = 1, #usersId do
		if (usersId[i] == useridDisconnect) then
			isAnBot = usersIsAnBot[i];
			break
		end
	end

	-- Print message --------------------
	if (isAnBot == 1) then
		ScriptPrintMessageChatAll("\x07 \x07 [Server] Bot \x08 \x08" .. nameDisconnect .. "\x07 \x07 disconnected.");
	else
		ScriptPrintMessageChatAll("\x07 \x07 [Server] User \x08 \x08" .. nameDisconnect .. "\x07 \x07 disconnected.");
	end

end

-- tListenerIds --------------------
tListenerIds = {
	ListenToGameEvent("player_connect", OnPlayerPutInServer, nil),
	ListenToGameEvent("player_disconnect", OnPlayerDisconnect, nil),
}
