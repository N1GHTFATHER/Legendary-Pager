fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description '80s Pager Notification Script'
version '1.0.0'

client_scripts {
    'notification.lua',
    'server.lua'
}

files {
    'html/index.html',
    'html/script.js',
    -- Uncomment these if you add the assets below:
     'html/pager.png',
     'html/ds-digi.ttf',
     'html/pager_beeps.mp3'
}

ui_page 'html/index.html'

exports {'ShowNotification'}
