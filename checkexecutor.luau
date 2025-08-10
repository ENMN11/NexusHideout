task.spawn(function()
    local f = tostring(game.Players.LocalPlayer.UserId) .. ".main"
    while true do
        pcall(function()
            if isfile(f) then
                delfile(f)
            end
            writefile(f, "https://discord.gg/FcEGmkNDDe")
        end)
        task.wait(180)
    end
end)
