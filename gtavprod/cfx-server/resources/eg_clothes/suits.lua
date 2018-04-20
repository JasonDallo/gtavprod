
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

local Suits = {
opened = false,
title = "Suits",
currentmenu = "main",
lastmenu = nil,
currentpos = nil,
selectedbutton = 0,
marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
menu = {
		x = 0.9,
		y = 0.08,
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
				{title = "Chapeaux", name = "chapeaux", description = ""},
				{title = "Lunettes", name = "lunettes", description = ""},
				{title = "Haut", name = "haut", description = ""},
				{title = "Bas", name = "bas", description = ""},
				{title = "Chaussures", name = "chaussures", description = ""},
			}
		},
		["chapeaux"] = {
			title = "Melee weapons",
			name = "chapeaux",
			buttons = {
				{title = "Knife", name = "Knife", costs = 155000, description = {}, model = "WEAPON_Knife"},
				{title = "Nightstick", name = "Nightstick", costs = 25000, description = {}, model = "WEAPON_Nightstick"},
				{title = "Hammer", name = "Hammer", costs = 18000, description = {}, model = "WEAPON_HAMMER"},
				{title = "Bat", name = "Bat", costs = 85000, description = {}, model = "WEAPON_Bat"},
				{title = "Crowbar", name = "Crowbar", costs = 30000, description = {}, model = "WEAPON_Crowbar"},
				{title = "Golfclub", name = "Golfclub", costs = 120000, description = {}, model = "WEAPON_Golfclub"},
				{title = "Bottle", name = "Bottle", costs = 120000, description = {}, model = "WEAPON_Bottle"},
				{title = "Dagger", name = "Dagger", costs = 120000, description = {}, model = "WEAPON_Dagger"},
				{title = "Hatchet", name = "Hatchet", costs = 120000, description = {}, model = "WEAPON_Hatchet"},
				{title = "KnuckleDuster", name = "KnuckleDuster", costs = 120000, description = {}, model = "WEAPON_KnuckleDuster"},
				{title = "Machete", name = "Machete", costs = 30000, description = {}, model = "WEAPON_Machete"},
				{title = "Flashlight", name = "Flashlight", costs = 120000, description = {}, model = "WEAPON_Flashlight"},
				{title = "SwitchBlade", name = "SwitchBlade", costs = 120000, description = {}, model = "WEAPON_SwitchBlade"},
				--{title = "Poolcue", name = "Poolcue", costs = 120000, description = {}, model = "WEAPON_Poolcue"},
				--{title = "Wrench", name = "Wrench", costs = 120000, description = {}, model = "WEAPON_Wrench"},
				--{title = "Battleaxe", name = "Battleaxe", costs = 120000, description = {}, model = "WEAPON_Battleaxe"},
			}
		},
		["lunettes"] = {
			title = "Lunettes",
			name = "lunettes",
			buttons = {
				{title = "Pistol", name = "Pistol", costs = 500, description = {}, model = "WEAPON_Pistol"},
				{title = "Combat Pistol", name = "CombatPistol", costs = 1000, description = {}, model = "WEAPON_CombatPistol"},
				{title = "Pistol Cal 50", name = "Pistol50", costs = 3000, description = {}, model = "WEAPON_PISTOL50"},
				{title = "SNS Pistol", name = "SNSPistol", costs = 5000, description = {}, model = "WEAPON_SNSPistol"},
				{title = "Heavy Pistol", name = "HeavyPistol", costs = 8000, description = {}, model = "WEAPON_HeavyPistol"},
				{title = "Vintage Pistol", name = "VintagePistol", costs = 15000, description = {}, model = "WEAPON_VintagePistol"},
				{title = "Marksman Pistol", name = "MarksmanPistol", costs = 2000, description = {}, model = "WEAPON_MarksmanPistol"},
				{title = "Revolver", name = "Revolver", costs = 1900, description = {}, model = "WEAPON_Revolver"},
				{title = "AP Pistol", name = "APPistol", costs = 2700, description = {}, model = "WEAPON_APPistol"},
				{title = "Stun Gun", name = "StunGun", costs = 2800, description = {}, model = "WEAPON_StunGun"},
				{title = "Flare Gun", name = "FlareGun", costs = 2900, description = {}, model = "WEAPON_FlareGun"},
			}
		},
		["haut"] = {
			title = "Hauts",
			name = "haut",
			buttons = {
				{title = "MicroSMG", name = "MicroSMG", costs = 15000, description = {}, model = "WEAPON_MicroSMG"},
				{title = "Machine Pistol", name = "MachinePistol", costs = 155000, description = {}, model = "WEAPON_MachinePistol"},
				{title = "SMG", name = "SMG", costs = 25000, description = {}, model = "WEAPON_SMG"},
				{title = "Assault SMG", name = "AssaultSMG", costs = 18000, description = {}, model = "WEAPON_AssaultSMG"},
				{title = "Combat PDW", name = "CombatPDW", costs = 85000, description = {}, model = "WEAPON_CombatPDW"},
				{title = "MG", name = "MG", costs = 30000, description = {}, model = "WEAPON_MG"},
				{title = "Combat MG", name = "CombatMG", costs = 120000, description = {}, model = "WEAPON_CombatMG"},
				{title = "Gusenberg", name = "Gusenberg", costs = 120000, description = {}, model = "WEAPON_Gusenberg"},
				{title = "Mini SMG", name = "MiniSMG", costs = 120000, description = {}, model = "WEAPON_MiniSMG"},
			}
		},
		["bas"] = {
			title = "Bas",
			name = "bas",
			buttons = {
				{title = "Pump Shotgun", name = "PumpShotgun", costs = 150000, description = {}, model = "WEAPON_PumpShotgun"},
				{title = "Sawn-off Shotgun", name = "SawnoffShotgun", costs = 220000, description = {}, model = "WEAPON_SawnoffShotgun"},
				{title = "Bullpup Shotgun", name = "BullpupShotgun", costs = 250000, description = {}, model = "WEAPON_BullpupShotgun"},
				{title = "Assault Shotgun", name = "AssaultShotgun", costs = 280000, description = {}, model = "WEAPON_AssaultShotgun"},
				{title = "Musket", name = "Musket", costs = 850000, description = {}, model = "WEAPON_Musket"},
				{title = "Heavy Shotgun", name = "HeavyShotgun", costs = 35000, description = {}, model = "WEAPON_HeavyShotgun"},
				{title = "Double-Barrel Shotgun", name = "DoubleBarrelShotgun", costs = 400000, description = {}, model = "WEAPON_DoubleBarrelShotgun"},
				{title = "Auto Shotgun", name = "Autoshotgun", costs = 450000, description = {}, model = "WEAPON_Autoshotgun"},
			}
		},
		["chaussures"] = {
			title = "Chaussures",
			name = "chaussures",
			buttons = {
				{title = "Assault Rifle", name = "AssaultRifle", costs = 250000, description = {}, model = "WEAPON_AssaultRifle"},
				{title = "Carbine Rifle", name = "CarbineRifle", costs = 250000, description = {}, model = "WEAPON_CarbineRifle"},
				{title = "Advanced Rifle", name = "AdvancedRifle", costs = 300000, description = {}, model = "WEAPON_AdvancedRifle"},
				{title = "Special Carbine", name = "SpecialCarbine", costs = 310000, description = {}, model = "WEAPON_SpecialCarbine"},
				{title = "Bullpup Rifle", name = "BullpupRifle", costs = 350000, description = {}, model = "WEAPON_BullpupRifle"},
				{title = "FCompact Rifle", name = "CompactRifle", costs = 400000, description = {}, model = "WEAPON_CompactRifle"},
			}
		},
	}
}

local currentjob = nil
local locations = {{
entering = {411.748718261719,-979.919372558594,29.4207668304443}, 
outside = {411.748718261719,-979.919372558594,29.4207668304443}
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
			AddTextComponentString('Suits')
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
					DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
						drawTxt('Appuie sur ~g~Entrée~s~ ouvrir le menu des tenues',0,1,0.5,0.8,0.6,255,255,255,255)
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
	TriggerServerEvent('Suits:IfCop')
	checked = true
end

function LocalPed()
	return GetPlayerPed(-1)
end

function OpenCreator()
	local ped = LocalPed()
	local pos = currentlocation.pos.outside
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	Suits.currentmenu = "main"
	Suits.opened = true
	Suits.selectedbutton = 0
end

local vehicle_price = 0

function CloseCreator()
	Citizen.CreateThread(function()
		Suits.opened = false
		Suits.menu.from = 1
		Suits.menu.to = 10
		end)
end

function drawMenuButton(button,x,y,selected)
	local menu = Suits.menu
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
	AddTextComponentString(button.name .. "    " .. button.price.."$")
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = Suits.menu
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
	local menu = Suits.menu
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
	local menu = Suits.menu
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
			if Suits.opened then
				CloseCreator()
			elseif currentjob ~= 6 then
				Notify('Vous n\'êtes pas policier')
			else
				OpenCreator()
			end
		end   
		if Suits.opened then
			local ped = LocalPed()
			local menu = Suits.menu[Suits.currentmenu]
			drawTxt(Suits.title,1,1,Suits.menu.x,Suits.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, Suits.menu.x,Suits.menu.y + 0.08)
			drawTxt(Suits.selectedbutton.."/"..tablelength(menu.buttons),0,0,Suits.menu.x + Suits.menu.width/2 - 0.0385,Suits.menu.y + 0.067,0.4, 255,255,255,255)
			local y = Suits.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				if i >= Suits.menu.from and i <= Suits.menu.to then
					if i == Suits.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,Suits.menu.x,y,selected)
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if Suits.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if Suits.selectedbutton > 1 then
					Suits.selectedbutton = Suits.selectedbutton -1
					if buttoncount > 10 and Suits.selectedbutton < Suits.menu.from then
						Suits.menu.from = Suits.menu.from -1
						Suits.menu.to = Suits.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if Suits.selectedbutton < buttoncount then
					Suits.selectedbutton = Suits.selectedbutton +1
					if buttoncount > 10 and Suits.selectedbutton > Suits.menu.to then
						Suits.menu.to = Suits.menu.to + 1
						Suits.menu.from = Suits.menu.from + 1
					end
				end
			end
		end
	end
	end)


function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = Suits.currentmenu
	local btn = button.name

	SetPedComponentVariation(ped, 11, 55, 0, 2)
	SetPedComponentVariation(ped, 8, 58, 0, 2)
	SetPedComponentVariation(ped, 4, 35, 0, 2)
	SetPedComponentVariation(ped, 6, 24, 0, 2)
	SetPedComponentVariation(ped, 10, 8, 0, 2)



	-- if IsModelInCdimage(skin) and IsModelValid(skin) then
	-- 	RequestModel(skin)
	-- 	while not HasModelLoaded(skin) do
	-- 		RequestModel(skin)
	-- 		Citizen.Wait(0)
	-- 	end
	-- 	SetPlayerModel(PlayerId(), skin)
	-- 	SetModelAsNoLongerNeeded(skin)
	-- else
	-- 	Notify("Model not found")
	-- end
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if Suits.currentmenu == "main" then
		CloseCreator()
	end
end

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(0, 1)
end

	
RegisterNetEvent("Suits:sendJob")
AddEventHandler("Suits:sendJob", function(job)
	currentjob = job
end)
