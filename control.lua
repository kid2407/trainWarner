if script.active_mods["debugadapter"] then
	require("__debugadapter__/debugadapter.lua")
end
ranges = {}

function loadSettings()
	if game then
		for index, player in pairs(game.players) do
			ranges[index] = player.mod_settings["train_warner_range"].value
		end
	end
end

function printNewSettingValue()
	loadSettings()
	if game then
		for index, player in pairs(game.connected_players) do
			player.print("New setting value: " .. range[index].value)
		end
	end
end

script.on_event(
	defines.events.on_runtime_mod_setting_changed,
	function(event)
		if event.player_index ~= nil then
			if event.setting == "train_warner_range" then
				player = game.players[event.player_index]
				player.print("Neuer Wert: " .. player.mod_settings["train_warner_range"].value)
			end
		end
	end
)
