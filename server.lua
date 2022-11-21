-- ================================================
--                 COMMAND
-- ================================================
RegisterCommand("vehwipe", function(source, args)
    TriggerClientEvent("vehiclewipe:delallveh", -1)
end, true)

-- ================================================
--                AUTO WIPE
-- ================================================
if Config.AutoWipe then 
    CreateThread(function()
        while true do
	    Wait((1000 * 60) * Config.Timer)
            if Config.ChatMessages then
	        TriggerClientEvent('chat:addMessage', -1, {template = '<div class="chat-message emergency"><r> {0}</r> {1}</div>', args = { "SYSTEM:", "Vehicle Wipe Incoming in "..Config.WarningTimer.." Min" } })
                Wait((1000 * 60) * Config.WarningTimer)                                                                             
                TriggerClientEvent("vehiclewipe:delallveh", -1)
            else
                TriggerClientEvent("vehiclewipe:delallveh", -1)
            end
        end
    end)
end
