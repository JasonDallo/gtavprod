 RegisterNetEvent('licences:NotifyAlreadybought')
 RegisterNetEvent('licences:NotifyNotEnoughMo')
 RegisterNetEvent('licences:LicencetoBuy')
 RegisterNetEvent('licences:NotifyBought')

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

local licences = {
	opened = false,
	title = "Licences",
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
				{name = "Prostitué", description = "", price = 1, id=1},
				{name = "Taxi", description = "", price = 1500, id=2},
				{name = "Mineur", description = "", price = 3000, id=3},
			}
    	},
  	}
}

local fakecar = {model = '', car = nil}
local locations = {{
entering = {415.033,-1015.048,28.300}, 
outside = {415.033,-1015.048,28.300}
}}


local garage_blips ={}
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
			AddTextComponentString('licences')
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
						drawTxt('Appuie sur ~g~Entrée~s~ ouvrir le menu des licences',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inr = true
					end
				end
				inrange = inr
			end
		end)
	end
end


function LocalPed()
	return GetPlayerPed(-1)
end

function OpenCreator()
	local ped = LocalPed()
	local pos = currentlocation.pos.outside
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	licences.currentmenu = "main"
	licences.opened = true
	licences.selectedbutton = 0
end

local vehicle_price = 0

function CloseCreator()
	Citizen.CreateThread(function()
		licences.opened = false
		licences.menu.from = 1
		licences.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = licences.menu
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
	local menu = licences.menu
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
	local menu = licences.menu
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
	local menu = licences.menu
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
				if licences.opened then
					CloseCreator()
				else
					OpenCreator()
				end
			end   
		if licences.opened then
			local ped = LocalPed()
			local menu = licences.menu[licences.currentmenu]
			drawTxt(licences.title,1,1,licences.menu.x,licences.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, licences.menu.x,licences.menu.y + 0.08)
			drawTxt(licences.selectedbutton.."/"..tablelength(menu.buttons),0,0,licences.menu.x + licences.menu.width/2 - 0.0385,licences.menu.y + 0.067,0.4, 255,255,255,255)
			local y = licences.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				if i >= licences.menu.from and i <= licences.menu.to then
					if i == licences.selectedbutton then
						selected = true
					else
						selected = false
					end
				drawMenuButton(button,licences.menu.x,y,selected)
				y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if licences.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if licences.selectedbutton > 1 then
					licences.selectedbutton = licences.selectedbutton -1
					if buttoncount > 10 and licences.selectedbutton < licences.menu.from then
						licences.menu.from = licences.menu.from -1
						licences.menu.to = licences.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if licences.selectedbutton < buttoncount then
					licences.selectedbutton = licences.selectedbutton +1
					if buttoncount > 10 and licences.selectedbutton > licences.menu.to then
						licences.menu.to = licences.menu.to + 1
						licences.menu.from = licences.menu.from + 1
					end
				end
			end
		end
	end
end)


function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = licences.currentmenu
	local btn = button.name
	TriggerServerEvent('licences:Alreadybought', button.id)
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if licences.currentmenu == "main" then
		CloseCreator()
	end
end
function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	drawNotification(false, false)
end
local firstspawn = 0
	AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		ShowGarageBlips(true)
		firstspawn = 1
	end
end)

 AddEventHandler("licences:NotifyAlreadybought", function()
 	 Notify('Vous avez déjà acheté cette licence')
 end)
AddEventHandler("licences:NotifyNotEnoughMo", function()
	Notify('Vous n\'avez pas assez d\'argent')
end)
AddEventHandler("licences:LicencetoBuy", function(licence)
	local menu = licences.menu[licences.currentmenu]
	for i,v in pairs(menu.buttons)do
		if v.id == licence then
			TriggerServerEvent('licences:CheckMoney', v)
		end
	end
end)

AddEventHandler("licences:NotifyBought", function(licence)
Notify('Vous avez bien acheté '.. licence)
end)

