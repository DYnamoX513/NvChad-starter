return {
  load_on_startup = true,
  header = {
    [[      .-.                         .    .                   /\   ]],
    [[        /|/|         /           /    /    .-.         _  / |   ]],
    [[       /   |  .-.---/---.-.     /    /     `-'.-.     (  /  |  .]],
    [[      /    |./.-'_ /   (  |    /    /     /  (         `/.__|_.']],
    [[ .-' /     |(__.' /     `-'-'_/_.-_/_.-_.(__. `---'.:' /    |   ]],
    [[(__.'      `.                                     (__.'     `-' ]],
    [[┳┓   ┓ •      ┏┓┓     ┳┳┓         ]],
    [[┃┃┏┓╋┣┓┓┏┓┏┓  ┣ ┃┏┏┓  ┃┃┃┏┓╋╋┏┓┏┓┏]],
    [[┛┗┗┛┗┛┗┗┛┗┗┫  ┗┛┗┛┗   ┛ ┗┗┻┗┗┗ ┛ ┛]],
    [[           ┛                      ]],
    [[󰹣  Format on save enabled (Conform)]],
    [[󱏾  Format on save disabled (Buffer)]],
    [[󱏽  Format on save disabled (Global)]],
    [[]],
  },
  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "󱩮  Toggle buffer format_on_save", keys = "Spc t f", cmd = "FormatToggle!" },
    { txt = "󱩭  Toggle global format_on_save", keys = "Spc t F", cmd = "FormatToggle" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "󱟬  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
