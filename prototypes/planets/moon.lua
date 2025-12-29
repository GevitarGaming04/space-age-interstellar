require("__PlanetsLib__/api")

local moon_flat = table.deepcopy(data.raw.tile["sand-1"])
moon_flat.name = "moon-flat"
moon_flat.localised_name = {"tile-name.moon-flat"}
moon_flat.walking_speed_modifier = 1.0
moon_flat.map_color = { r = 0.75, g = 0.75, b = 0.80 }
moon_flat.absorptions_per_second = nil
data:extend{moon_flat}

local nauvis = data.raw["planet"]["nauvis"]
local cliff = table.deepcopy(nauvis.map_gen_settings.cliff_settings)

PlanetsLib:extend({
    {
        type = "planet",
        name = "moon",
        localised_name = {"nauvis.moon"},
        icons = {
        {
            icon = "__space-age-interstellar__/graphics/starmap/moon-icon.png",
            icon_size = 256
        }
        },

        subgroup = "satellites",
        is_satellite = true,

        orbit = {
            parent = {type = "planet", name = "nauvis"},
            distance = 3,
            orientation = 0.30,
            sprite = {
                filename = "__space-age-interstellar__/graphics/starmap/moon-orbit.png",
                size = 2048,
                scale = 0.075,
                flags = {"gui-icon"}
            }
        },

        magnitude = 0.5,
        starmap_icon = "__space-age-interstellar__/graphics/starmap/moon-icon.png",
        starmap_icon_size = 256,

        gravity_pull = (nauvis and nauvis.gravity_pull) or 10,
        surface_properties = {
            ["day-night-cycle"] = 25200,
            ["solar-power"] = 80,
            ["gravity"] = 1.5,
            ["pressure"] = 0,
            ["magnetic-field"] = 0,
        },

        surface_render_parameters = {
        planet_color = { r = 0.7, g = 0.7, b = 0.8 },
        atmosphere_color = { r = 0.4, g = 0.4, b = 0.5 },
        },

        map_gen_settings = {
            property_expression_names = {
                ["control-setting:temperature:frequency:multiplier"] = "0.5",
                ["control-setting:moisture:frequency:multiplier"] = "0.0",
            },
            autoplace_settings = {
                tile = {
                    settings = {
                        ["moon-flat"] = {
                            frequency = 1,
                            size = 1,
                            richness = 1
                        }
                    }
                }
            },
            autoplace_controls = {
                ["iron-ore"] = {
                    frequency = 1.3,
                    size = 0.7,
                    richness = 1.3
                },
                ["copper-ore"] = {
                    frequency = 1.3,
                    size = 0.7,
                    richness = 1.3
                },
            },
            cliff_settings = cliff
        }
    }
})

data:extend({
    {
        type = "space-connection",
        name = "nauvis-to-moon",
        from = "nauvis",
        to = "moon",
        distance = 1000,
        icon = "__base__/graphics/icons/satellite.png",
        icon_size = 64,
        asteroid_spawn_definitions = {
            {
                type = "asteroid-chunk",
                asteroid = "metallic-asteroid-chunk",
                spawn_points = {
                { distance = 0,    probability = 0.8, speed = 0.8 },
                { distance = 1000, probability = 0.8, speed = 0.8 },
                }
            },
            {
                type = "asteroid-chunk",
                asteroid = "carbonic-asteroid-chunk",
                spawn_points = {
                { distance = 0,    probability = 0.4, speed = 0.8 },
                { distance = 1000, probability = 0.4, speed = 0.8 },
                }
            },
            {
                type = "asteroid-chunk",
                asteroid = "oxide-asteroid-chunk",
                spawn_points = {
                { distance = 0,    probability = 0.2, speed = 0.8 },
                { distance = 1000, probability = 0.2, speed = 0.8 },
                }
            },
        }
    }
})
