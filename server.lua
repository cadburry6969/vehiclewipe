-- ================================================
--                 COMMAND
-- ================================================
RegisterCommand("vehwipe", function(source, args)
	local src = source
    if IsPlayerAceAllowed(src, "command")
    TriggerClientEvent("vehwipe:client:delallveh", -1)
end)

-- ================================================
--                AUTO WIPE
-- ================================================
if Config.AutoWipe then 
    Citizen.CreateThread(function()       
        while true do                    
            Citizen.Wait((1000 * 60) * Config.Timer)
            if Config.ChatMessages then
	        TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message emergency"><r> {0}</r> {1}</div>', args = { "SYSTEM:", "Vehicle Wipe Incoming in "..Config.WarningTimer.." Min" } })
                Citizen.Wait((1000 * 60) * Config.WarningTimer)                                                                             
                TriggerClientEvent("vehwipe:client:delallveh", -1)
            else
                TriggerClientEvent("vehwipe:client:delallveh", -1)
            end            
            Citizen.Wait(0)
        end
    end)
end
