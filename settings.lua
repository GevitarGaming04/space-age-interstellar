data:extend({
    {
        type = "int-setting",
        name = "example-setting",
        setting_type = "startup",
        minimum_value = 1,
        maximum_value = 100,
        default_value = 50
    },
    {
        type = "bool-setting",
        name = "hidden-example-setting",
        setting_type = "runtime-global",
        hidden = true,
        default_value = false
    }
})