require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "45ab0defda")

RegisterServerEvent('Weapons:IfCop')

AddEventHandler("Weapons:IfCop", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local player = user.identifier
		local executedQuery = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@username'",{['@username'] = player})
		local result = MySQL:getResults(executedQuery , {'job'})
		if (result) then
			for _, v in ipairs(result) do
				local job = v.job
				print(job)
				TriggerClientEvent("Weapons:sendJob", source, job)
			end
		end
	end)
end)