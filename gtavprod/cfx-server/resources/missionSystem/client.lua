Citizen.CreateThread(function()
    while true do
		SetWeatherTypePersist("EXTRASUNNY")
        	SetWeatherTypeNowPersist("EXTRASUNNY")
       		SetWeatherTypeNow("EXTRASUNNY")
       		SetOverrideWeather("EXTRASUNNY")
    		Citizen.Wait(1)
	end
end)

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(0)
 		if IsControlPressed(1, 303) then
 		SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
 		end
 	end
 end)



RegisterNetEvent('missionSystem:processGetWeed')
AddEventHandler('missionSystem:processGetWeed', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte < 30 then
		TriggerEvent('player:receiveItem',1, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Vous avez récolté 1 feuille de Coca.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous n'avez plus de place.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processGetShit')
AddEventHandler('missionSystem:processGetShit', function(qteWeed, qteShit)
	if(qteWeed == nil) then
		qteWeed = 0
	end
	
	if(qteShit == nil) then
		qteShit = 0
	end

    if qteShit < 30 and qteWeed > 0 then
		TriggerEvent('player:receiveItem',2, 1)
		TriggerEvent('player:looseItem',1, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~1 cocaine traitée.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Plus rien à traiter.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processSellShit')
AddEventHandler('missionSystem:processSellShit', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte > 0 then
		TriggerEvent('player:looseItem',2, 1)
		TriggerServerEvent('mission:completed', 50)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~+50$ pour 1 cocaine.")
		DrawSubtitleTimed(2000, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~T'a rien à vendre !")
		DrawSubtitleTimed(2000, 1)
	end
end)

Citizen.CreateThread(function()
listOn = false
	while true do
		Wait(0)
		
		-- HARVEST WEED - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1905.14331054688,4886.01220703125,47.1335029602051, true) <= 10 then						
			TriggerServerEvent('missionSystem:getWeed')
			Citizen.Wait(5000)
		end		
		-- HARVEST WEED - END
		
		
		-- HARVEST SHIT - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 58.8187294006348,3683.3603515625,39.837329864502, true) <= 5 then						
			TriggerServerEvent('missionSystem:getShit')
			Citizen.Wait(5000)
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -106.086303710938,-2230.79516601563,7.81167411804199, true) <= 5 then
			TriggerServerEvent('missionSystem:sellShit')
			Citizen.Wait(2500)
		end
		
		-- HARVEST SHIT - END
		
	end
end)

--------------------------------- FIN DROGUE ----------------------------------------

----------------------------------- MINEUR ------------------------------------------


RegisterNetEvent('missionSystem:processGetDiamsB')
AddEventHandler('missionSystem:processGetDiamsB', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte < 30 then
		TriggerEvent('player:receiveItem',3, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Vous avez miné 1 diamant brut.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous n'avez plus de place.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processGetDiams')
AddEventHandler('missionSystem:processGetDiams', function(qteDiamsB, qteDiams)
	if(qteDiamsB == nil) then
		qteDiamsB = 0
	end
	
	if(qteDiams == nil) then
		qteDiams = 0
	end

    if qteDiams < 30 and qteDiamsB > 0 then
		TriggerEvent('player:receiveItem',4, 1)
		TriggerEvent('player:looseItem',3, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Traitement du diamant en cours.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous ne pouvez plus traiter de diamants.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processSellDiams')
AddEventHandler('missionSystem:processSellDiams', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte > 0 then
		TriggerEvent('player:looseItem',4, 1)
		TriggerServerEvent('mission:completed', 50)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~+50$ pour 1 diamant.")
		DrawSubtitleTimed(2000, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~Vous n'avez rien à vendre.")
		DrawSubtitleTimed(2000, 1)
	end
end)



Citizen.CreateThread(function()
listOn = false
	while true do
		Wait(0)
		
		-- HARVEST Diamant - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2945.14331054688,2796.76635742188,40.21630859375, true) <= 10 then						
			TriggerServerEvent('missionSystem:getDiamsB')
			Citizen.Wait(5000)
		end		
		-- HARVEST Diamant - END
		
		
		-- HARVEST Diamant - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1701.44848632813,-1500.59387207031,112.968475341797, true) <= 5 then						
			TriggerServerEvent('missionSystem:getDiams')
			Citizen.Wait(5000)
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 112.998138427734,-399.107391357422,41.264030456543, true) <= 5 then
			TriggerServerEvent('missionSystem:sellDiams')
			Citizen.Wait(2500)
		end
		
		-- HARVEST Diamant - END
		
	end
end)

--------------------- FIN MINEUR ----------------------------------------