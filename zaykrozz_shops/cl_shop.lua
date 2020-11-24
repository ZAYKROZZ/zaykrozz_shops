ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

local Superette = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {50, 50, 50}, Title = "Supérette"},
	Data = { currentMenu = "Stock du magasin !", "Supérette" },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result)
			
            if btn.name == "Pain" then

                TriggerServerEvent('buyPain')

            end

            if btn.name == "Eau" then

                TriggerServerEvent('buyEau')
        
            end
                
            if btn.name == "IceTea" then

                TriggerServerEvent('buyIceTea')
            
            end

            if btn.name == "~g~Electronique" then

                OpenMenu("~g~Electronique")
            end

            if btn.name == "Radio" then
                
                TriggerServerEvent("BuyRadio")
            end

            if btn.name == "Téléphone" then
                
                TriggerServerEvent("BuyPhone")
            end
                            
            if btn.name == "~g~Abonnement" then

                OpenMenu("~g~Abonnement")
            end

            if btn.name == "SIM" then
                
                TriggerServerEvent("BuySim")
            end

            end,
    },
	
	Menu = {
        ["Stock du magasin !"] = {
            b = {
                {name = "Pain", ask = "> ~g~20$", askX = true},
                {name = "Eau", ask = "> ~g~20$", askX = true},
                {name = "IceTea", ask = "> ~g~35$", askX = true},
                {name = "~g~Abonnement", ask = "→", askX = true},
                {name = "~g~Electronique", ask = "→", askX = true}, 
            }
        },


        ["~g~Electronique"] = {
            b = {
                {name = "Radio", ask = "> ~g~300$", askX = true},
                {name = "Téléphone", ask = "> ~g~800$", askX = true},
            }
        },

        ["~g~Abonnement"] = {
            b = {
                {name = "SIM", ask = "> ~g~150$", askX = true},
            }
        }
    }
}

--- Parler au ped

local positionSuperette = {
    {x = 25.82, y = -1345.49, z = 29.5},
    {x = 373.875,   y = 325.896,  z = 102.66},
	{x = 2557.458,  y = 382.282,  z = 107.722}, 
	{x = -3038.939, y = 585.954,  z = 6.97},
	{x = -3241.927, y = 1001.462, z = 11.850}, 
	{x = 547.431,   y = 2671.710, z = 41.176}, 
	{x = 1961.464,  y = 3740.672, z = 31.363}, 
	{x = 2678.916,  y = 3280.671, z = 54.261}, 
    {x = 1729.216,  y = 6414.131, z = 34.057}, 
    {x = 1135.808,  y = -982.281,  z = 45.45}, 
	{x = -1222.93, y = -906.99,  z = 11.35}, 
	{x = -1487.553, y = -379.107,  z = 39.163}, 
	{x = -2968.243, y = 390.910,   z = 14.054}, 
	{x = 1166.024,  y = 2708.930,  z = 37.167}, 
	{x = 1392.562,  y = 3604.684,  z = 33.995}, 
	{x = -1393.409, y = -606.624,  z = 29.319}, 
    {x = -48.519,   y = -1757.514, z = 28.47}, 
	{x = 1163.373,  y = -323.801,  z = 68.27}, 
	{x = -707.67,  y = -914.22,  z = 18.26}, 
	{x = -1820.523, y = 792.518,   z = 137.20},
	{x = 1698.388,  y = 4924.404,  z = 41.083}
}

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)

--         for k in pairs(positionSuperette) do

--             local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
--             local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionSuperette[k].x, positionSuperette[k].y, positionSuperette[k].z)

--             if dist <= 1.0 then
--                 ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~g~Apu !")
-- 				if IsControlJustPressed(1,51) then 
--                     CreateMenu(Superette)
-- 				end
--             end
--         end
--     end
-- end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionSuperette) do

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionSuperette[k].x, positionSuperette[k].y, positionSuperette[k].z)

        if (GetDistanceBetweenCoords(coords, dist, true) < 1.0) then
            ESX.DrawMissionText("Appuyez sur [~g~E~s~] pour parler avec ~g~Apu !", 20)
            DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
            if IsControlJustReleased(1, 51) then
                CreateMenu(Superette)
              end
            end
        end
    end
end)

-- Blips


Citizen.CreateThread(function()

	for i=1, #Config.ShopsL, 1 do

		local blip = AddBlipForCoord(Config.ShopsL[i].x, Config.ShopsL[i].y, Config.ShopsL[i].z)

		SetBlipSprite (blip, 52)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Supérette")
        EndTextCommandSetBlipName(blip)
	end

end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(positionSuperette) do
				if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, positionSuperette[k].x, positionSuperette[k].y, positionSuperette[k].z, true) < Config.DrawDistance) then
                    DrawMarker(Config.Type, positionSuperette[k].x, positionSuperette[k].y, positionSuperette[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
        print("Script developped by Zaykrozz ! Contact me to https://discord.gg/6sWDKqU72H ! |  Script developpé par Zaykrozz ! Contactez moi sur https://discord.gg/6sWDKqU72H !")
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(8000)
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
		print('^3SCRIPT FREE BY Zaykrozz#2726')
	end
end)