if SERVER then
    -- Create an array of blacklisted words
    local blacklistedWords = {"blacklisted_word", "blacklisted_word2", "blacklisted_word3"}

    -- Hook into the PlayerSay event which is called whenever a player says something in chat.
    hook.Add("PlayerSay", "ChatFilter", function(ply, text)
        -- Convert the player's message to lowercase for case-insensitive comparison
        local lowerText = string.lower(text)

        -- Check if the message contains any of the blacklisted words
        for _, word in ipairs(blacklistedWords) do
            if string.find(lowerText, word) then
                if sam then
                    RunConsoleCommand("sam", "kick", ply:Nick(), "You have been kicked for using a blacklisted word.")
                else
                    ply:Kick("You have been kicked for using a blacklisted word.")
                end
                -- Return an empty string to prevent the message from being shown in chat
                return ""
            end
        end
    end)

    MsgC(Color(0, 255, 0), "\n\n\n" .. [[

    ██████╗  ██████╗ ████████╗████████╗██╗   ██╗    ███╗   ███╗ ██████╗ ██╗   ██╗████████╗██╗  ██╗
    ██╔══██╗██╔═══██╗╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝    ████╗ ████║██╔═══██╗██║   ██║╚══██╔══╝██║  ██║
    ██████╔╝██║   ██║   ██║      ██║    ╚████╔╝     ██╔████╔██║██║   ██║██║   ██║   ██║   ███████║
    ██╔═══╝ ██║   ██║   ██║      ██║     ╚██╔╝      ██║╚██╔╝██║██║   ██║██║   ██║   ██║   ██╔══██║
    ██║     ╚██████╔╝   ██║      ██║      ██║       ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝   ██║   ██║  ██║
    ╚═╝      ╚═════╝    ╚═╝      ╚═╝      ╚═╝       ╚═╝     ╚═╝ ╚═════╝  ╚═════╝    ╚═╝   ╚═╝  ╚═╝
                                                                                                     
                                        Loaded Successfully!                                                                     

    ]] .. "\n\n\n")
end
