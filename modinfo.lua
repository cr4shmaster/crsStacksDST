name = "Stacks"
description = "Allows everything to stack up to your desired value."
author = "cr4shmaster"
version = "1.3.2"

forumthread = ""

api_version = 10

all_clients_require_mod = true
dst_compatible = true
client_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {

	{
		name = "StacksConfig",
		label = "Maximum stack size:",
		options = {
			{description = "10", data = 10},
			{description = "20", data = 20},
			{description = "40", data = 40},
			{description = "50", data = 50},
			{description = "60", data = 60},
			{description = "70", data = 70},
			{description = "80", data = 80},
			{description = "90", data = 90},
			{description = "100", data = 100},
			{description = "200", data = 200},
			{description = "500", data = 500},
			{description = "1000", data = 1000},
			{description = "9999", data = 9999},
		},
		default = 100,
	},
}

server_filter_tags = {"Stacks"}