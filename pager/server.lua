-- Example in the server-side mail script
RegisterCommand('sendmail', function(source, args, rawCommand)
    local recipientMailAddress = args[1] -- Assuming the first argument is the recipient's email address
    local message = "You've got new mail!"

    -- Fetch the recipient’s player ID from the database
    MySQL.Async.fetchScalar('SELECT player_id FROM users WHERE mail_address = @address', {
        ['@address'] = recipientMailAddress
    }, function(recipientId)
        if recipientId then
            -- Send the notification to the specific recipient client
            TriggerClientEvent('pager:ShowNotification', recipientId, message)
        else
            print("Error: Recipient ID is nil or player is not online.")
        end
    end)
end, false)
