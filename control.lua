script.on_init(function()
    for _, force in pairs(game.forces) do
        local tech = force.technologies["moon-always-unlocked"]
        if tech and not tech.researched then
            tech.researched = true
        end
    end
end)
