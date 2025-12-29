require("prototypes.planets.moon")

data:extend({
    {
        type = "technology",
        name = "moon-always-unlocked",
        icon = "__space-age-interstellar__/graphics/starmap/moon-icon.png",
        icon_size = 256,
        unit = {
            count = 1,
            time = 1,
            ingredients = {{"automation-science-pack", 1}},
        },
        prerequisites = {},
        effects = {
            {
                type = "unlock-space-location",
                space_location = "moon",
            }
        },
        order = "z[moon]"
    }
})
