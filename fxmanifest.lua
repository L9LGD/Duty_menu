fx_version 'cerulean'
game 'gta5'

author 'Mike'
description 'Duty selection menu'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}

dependencies {
    'ox_lib'
}

-- Enable Lua 5.4
lua54 'yes'
