fx_version 'cerulean'
game 'gta5'

name 'Brave-RadioList'
author 'KT_ BRAVEHEART#9005'
description 'Radio List : List of players in each radio for pma-voice'

shared_scripts {
	'Config.lua',
}

ui_page "ui/index.html"

files {
	"ui/index.html"
}

server_script {
	"Server/*.lua"
}

client_script {
	"Client/*.lua"
}


