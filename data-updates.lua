local tech = data.raw.technology["space-platform-science-pack"]
if tech then
    tech.effects = tech.effects or {}
    table.insert(tech.effects, {
        type = "unlock-space-location",
        space_location = "moon"
    })
end


local orbit = data.raw["space-location"] and data.raw["space-location"]["nauvis.moon"]
if orbit then
    orbit.surface_properties = orbit.surface_properties or {}
    orbit.surface_properties["solar-power"] = 300
end
