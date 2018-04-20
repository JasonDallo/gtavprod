
local Keys = {
["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Weapons = {
opened = false,
title = "Weapons",
currentmenu = "main",
lastmenu = nil,
currentpos = nil,
selectedbutton = 0,
marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
menu = {
x = 0.9,
y = 0.3,
width = 0.2,
height = 0.04,
buttons = 10,
from = 1,
to = 10,
scale = 0.4,
font = 0,
["main"] = {
title = "CATEGORIES",
name = "main",
buttons = {
{name = "Stanier", description = "", price = 0, model="police3"},
{name = "Buffalo", description = "", price = 0, model="police2"},
{name = "Autre", description = "", price = 0, model="policet"},
}
},
}
}

local currentjob = nil
local locations = {{
entering = {452.371,-980.467,29.689}, 
outside = {452.371,-980.467,30.689}
}}


local garage_blips ={}
local checked = false
local inrange = false
local currentlocation = nil

local function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end



function IsPlayerInRange()
	return inrange
end

function ShowGarageBlips(bool)
	if bool and #garage_blips == 0 then
		for station,pos in pairs(locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			SetBlipSprite(blip,357)
			SetBlipColour(blip, 3)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Weapons')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(garage_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #garage_blips > 0 do
				Citizen.Wait(0)
				local inr = false
				for i,b in ipairs(garage_blips) do
					DrawMarker(1,454.03,-1020.87,27.30,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					DrawMarker(1,462.76,-1019.62,28.10,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if GetDistanceBetweenCoords(454.03,-1020.87,27.30,GetEntityCoords(LocalPed())) < 1 then
						drawTxt('Appuie sur ~g~Entrée~s~ ouvrir le garage',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inr = true
						if checked == false then
							CheckCop()
						end
					end
				end
				inrange = inr
			end
			end)
	end
end

function CheckCop()
	TriggerServerEvent('Weapons:IfCop')
	checked = true
end

function LocalPed()
	return GetPlayerPed(-1)
end

function OpenCreator()
	local ped = LocalPed()
	local pos = currentlocation.pos.outside
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	Weapons.currentmenu = "main"
	Weapons.opened = true
	Weapons.selectedbutton = 0
end

local vehicle_price = 0

function CloseCreator()
	Citizen.CreateThread(function()
		Weapons.opened = false
		Weapons.menu.from = 1
		Weapons.menu.to = 10
		end)
end

function drawMenuButton(button,x,y,selected)
	local menu = Weapons.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = Weapons.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = Weapons.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
	local menu = Weapons.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end
	return count
end
local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRange() then
			if Weapons.opened then
				CloseCreator()
				elseif currentjob ~= 6 then
					Notify('Vous n\'êtes pas policier')
				else
					OpenCreator()
				end
			end   
			if Weapons.opened then
				local ped = LocalPed()
				local menu = Weapons.menu[Weapons.currentmenu]
				drawTxt(Weapons.title,1,1,Weapons.menu.x,Weapons.menu.y,1.0, 255,255,255,255)
				drawMenuTitle(menu.title, Weapons.menu.x,Weapons.menu.y + 0.08)
				drawTxt(Weapons.selectedbutton.."/"..tablelength(menu.buttons),0,0,Weapons.menu.x + Weapons.menu.width/2 - 0.0385,Weapons.menu.y + 0.067,0.4, 255,255,255,255)
				local y = Weapons.menu.y + 0.12
				buttoncount = tablelength(menu.buttons)
				local selected = false
				for i,button in pairs(menu.buttons) do
					if i >= Weapons.menu.from and i <= Weapons.menu.to then
						if i == Weapons.selectedbutton then
							selected = true
						else
							selected = false
						end
						drawMenuButton(button,Weapons.menu.x,y,selected)
						y = y + 0.04
						if selected and IsControlJustPressed(1,201) then
							ButtonSelected(button)
						end
					end
				end
			end
			if Weapons.opened then
				if IsControlJustPressed(1,202) then
					Back()
				end
				if IsControlJustReleased(1,202) then
					backlock = false
				end
				if IsControlJustPressed(1,188) then
					if Weapons.selectedbutton > 1 then
						Weapons.selectedbutton = Weapons.selectedbutton -1
						if buttoncount > 10 and Weapons.selectedbutton < Weapons.menu.from then
							Weapons.menu.from = Weapons.menu.from -1
							Weapons.menu.to = Weapons.menu.to - 1
						end
					end
				end
				if IsControlJustPressed(1,187)then
					if Weapons.selectedbutton < buttoncount then
						Weapons.selectedbutton = Weapons.selectedbutton +1
						if buttoncount > 10 and Weapons.selectedbutton > Weapons.menu.to then
							Weapons.menu.to = Weapons.menu.to + 1
							Weapons.menu.from = Weapons.menu.from + 1
						end
					end
				end
			end
		end
		end)


function ButtonSelected(button)
	-- local ped = GetPlayerPed(-1)
	-- local this = Weapons.currentmenu
	-- local btn = button.name
	-- local weapon = GetHashKey(button.model)
	-- local spawnpoint = GetEntityCoords(playerPed)

	-- 	veh = CreateVehicle(weapon, 449.79,-1018.37,28.52, true, false)
	-- 	TaskWarpPedIntoVehicle(playerPed, veh, -1)



	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local btn = button.name
	local vehicle = GetHashKey(button.model)
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	local plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, 448.17, -1020.09, 28.49, true, false)
	SetVehicleOnGroundProperly(spawned_car)
	-- if GetPlayerIdentifiers(LocalPed()) == 'steam:110000105bbf1f6' then
	-- 	SetVehicleNumberPlateText(spawned_car, "BEAUF "..plate.." ")
	-- elseif GetPlayerIdentifiers(LocalPed()) == 'steam:110000107075ae6' then
	-- 	SetVehicleNumberPlateText(spawned_car, "PRO "..plate.." ")
	-- else
		SetVehicleNumberPlateText(spawned_car, "LSPD "..plate.." ")
	-- end
	SetPedIntoVehicle(myPed, spawned_car, -1)
end



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(462.76,-1019.62,28.10,GetEntityCoords(LocalPed())) < 1 then
	local vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
	Citizen.InvokeNative(0xEA386986E786A54F,Citizen.PointerValueIntInitialized(vehicle))
	SetEntityCoords(LocalPed(), 454.270, -1016.969, 28.435)
		end
	end
end)


function Back()
	if backlock then
		return
	end
	backlock = true
	if Weapons.currentmenu == "main" then
		CloseCreator()
	end
end
function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(0, 1)
end
local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		ShowGarageBlips(true)
		firstspawn = 1
	end
	end)
RegisterNetEvent("Weapons:sendJob")
AddEventHandler("Weapons:sendJob", function(job)
	currentjob = job
	end)
