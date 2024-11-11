-- notification.lua (Client-Side)

--- Display a notification on the UI using pv-pager files
--- @param text string The text to display on the notification
function ShowNotification(text)
    SendNUIMessage({
        action = 'showNotification',
        message = text
    })
end

-- Export the function so it can be called from other client scripts
exports('ShowNotification', ShowNotification)

-- Register a test command for triggering the notification
RegisterCommand("testpager", function()
    ShowNotification("This is a test notification!")
end, false)

-- Listen for a notification event sent from the server
RegisterNetEvent('pager:ShowNotification')
AddEventHandler('pager:ShowNotification', function(message)
    ShowNotification(message)
end)

-- Listen for mail events and display pager notification instead
RegisterNetEvent('mail:received')
AddEventHandler('mail:received', function()
    ShowNotification("You've got new mail!")
end)

RegisterNetEvent('rys_postoffice:newMail')
AddEventHandler('rys_postoffice:newMail', function(data)
    ShowNotification("You've got mail!")
end)


RegisterCommand("testpager", function()
    ShowNotification("You've got mail!")  -- Test message
end, false)

-- Add more listeners here if you find other relevant events

