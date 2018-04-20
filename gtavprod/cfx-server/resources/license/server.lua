require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "45ab0defda")

RegisterServerEvent('Weapons:IfCop')

AddEventHandler("Weapons:IfCop", function(user)
	local player = user.identifier
	local executedQuery = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@username'", {['@username'] = player})
	local res = MySQL:getResults(executedQuery , {'job'}, 'identifier')

	if(res) then
		for k,v in ipairs(res) do
  			TriggerClientEvent('Police:sendJob', v.job)
		end
	end
end)
