ESX = nil 
local player = GetPlayerPed(-1)
local coords = GetEntityCoords(player)
print("""

_____   _____  __                _______          __  .__     
/  _  \_/ ____\/  |_  ___________ \      \ _____ _/  |_|  |__  
/  /_\  \   __\\   __\/ __ \_  __ \/   |   \\__  \\   __\  |  \ 
/    |    \  |   |  | \  ___/|  | \/    |    \/ __ \|  | |   Y  \
\____|__  /__|   |__|  \___  >__|  \____|__  (____  /__| |___|  /
      \/                 \/              \/     \/          \/ 
Creativity And Inovaion

""")


print("""

For
______      __    __           ____  ____ 
/ ____/___  / /___/ /__  ____  / __ \/ __ \
/ / __/ __ \/ / __  / _ \/ __ \/ /_/ / /_/ /
/ /_/ / /_/ / / /_/ /  __/ / / / _, _/ ____/ 
\____/\____/_/\__,_/\___/_/ /_/_/ |_/_/      
By Nitrox And AfterNath

""")

                                           

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
        end)
    end
end)
-- roulade
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IsControlPressed(0, 25)
            then DisableControlAction(0, 22, true)
        end
    end
end) 
-- driveby
local passengerDriveBy = false
Citizen.CreateThread(function()
    while true do
        Wait(1)

        playerPed = GetPlayerPed(-1)
        car = GetVehiclePedIsIn(playerPed, false)
        if car then
            if GetPedInVehicleSeat(car, -1) == playerPed then
                SetPlayerCanDoDriveBy(PlayerId(), false)
            elseif passengerDriveBy then
                SetPlayerCanDoDriveBy(PlayerId(), true)
            else
                SetPlayerCanDoDriveBy(PlayerId(), false)
            end
        end
    end
end) 
-- viseur
Citizen.CreateThread(function()
    local isSniper = false
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local currentWeaponHash = GetSelectedPedWeapon(ped)
        if currentWeaponHash == 100416529 then
            isSniper = true
        elseif currentWeaponHash == 205991906 then
            isSniper = true
        elseif currentWeaponHash == -952879014 then
            isSniper = true
        elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
            isSniper = true
        else
            isSniper = false
        end
        if not isSniper then
            HideHudComponentThisFrame(14)
        end
    end
end) 
-- train
Citizen.CreateThread(function()
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    N_0x21973bbf8d17edfa(0, 120000)
    SetRandomTrains(true)
end) 
-- Coup de crosse
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
           DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        end
    end
end)
-- no drop PNJ
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    -- pickup hashes (https://pastebin.com/8EuSv2r1)
    RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
    RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
    RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
  end
end)
-- anti bunnyhop
local NumberJump = 15
Citizen.CreateThread(function()
  local Jump = 0
  while true do
      Citizen.Wait(1)
      local ped = PlayerPedId()
      if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
        Jump = Jump + 1
          if Jump == NumberJump then
              SetPedToRagdoll(ped, 5000, 1400, 2)
              Jump = 0
          end
      else 
          Citizen.Wait(500)  
      end
  end
end)
-- /id command
TriggerEvent('chat:addSuggestion', '/id', 'Voir son ID', {})
RegisterCommand('id', function(source, args)
TriggerEvent('chatMessage', "[".. "ID" .. "]" , {0, 0, 255}, " ^5  Votre ID est: " .. GetPlayerServerId(source))   
end, false)
-- Menu Pause
function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
end	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~o~GoldenRP~s~ | Discord : ~g~discord.gg/golenrp~s~ | ID: "..id..")
end
Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)
Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_LEAVE", "~r~Se déconecter de ~w~~y~GoldenRP~s~ 👋")
end)
Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_QUIT", "~r~Fermer ~o~FiveM 🐌")
end)
-- ajouter : `| ~r~".. #players .." Joueurs sont connectés"` pour les joueurs connectés