config = {
    clientid = 801534049944207381, -- this is your application bot id. read the read me

    icons = {
        small = {
            text = "discord.gg/RquDVTfDwu",
            icon = "https://i.imgur.com/ZsuQUE3.png",
        },
        big = {
            text = "NAT2K15 RP",
            icon = "https://i.imgur.com/ZsuQUE3.png",
        }
    },

    messages = {
        startingMessage =  "Playing by {name} with the id of {id}",
        rotateMessages = {
            enabled = true,
            -- vars are {count} | {name} | {id} | {uptime} | {serveruptime}
            messages = {
                "Playing by {name} with the id of {id}", -- {name} will be replaced with the players username {id}
                "I have been on for {uptime}", -- {uptime} will be replaced with the bots uptime
                "the server has been online for {serveruptime}", -- {serveruptime} will be replaced with the servers uptime
                "Playing with {count} users", -- {count} will be replaced with the total player count in the server
                "Blowing people up in NAT RP",
                "Join us today!",
                "discord.gg/RquDVTfDwu",
                "store.nat2k15.xyz",

            }
        }
    },
    discordButtons = {
        enabled = true,
        buttons = {
            {
                label = "Website",
                url = "https://store.nat2k15.xyz",
            },
            {
                enabled = true,
                label = "Invite",
                url = "https://discord.gg/RquDVTfDwu",
            }
        }
    }
}