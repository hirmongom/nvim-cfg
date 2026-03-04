-- Load the default onedark theme table from lualine
local onedark = require("lualine.themes.onedark")

-- Change colors globally
local custom_colour = { fg = "#C0C0C0", bg = "#222526" }
onedark.inactive.a = custom_colour
onedark.inactive.b = custom_colour
onedark.inactive.c = custom_colour
onedark.normal.a.bg = "#CCCCCC"

-- Load Plugin
require("lualine").setup {
  options = {
    theme = onedark,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = ""},
    always_divide_middle = false,
    disabled_filetypes = {
      statusline = { "NvimTree" },
      winbar = { "NvimTree" },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { 
      { "filename",
        newfile_status = true,
        path = 1,
        color = custom_colour,
      },
    },
    lualine_c = {},
    lualine_x = { function() return require("util.buffer").get_buffer_counts_str() end },
    lualine_y = { "encoding", "fileformat" },
    lualine_z = { 
      { "location",
        color = custom_colour,
      },
    },
  },
  tabline = {
    lualine_a = {
      { "filename",
        newfile_status = true,
        path = 0,
        color = custom_colour,
        fmt = function(name)
          local prefix = "NvimTree"
          if name:sub(1, #prefix) == prefix then
            return "\u{f07c}"
          end
          return name
        end,
      },
      -- { "buffers", 
      --  mode = 4,
      --  icons_enabled = false,
      --  filetype_names = {
      --    NvimTree = "\u{f07c}",
      --  },
      --  buffers_color = {
      --    active = "lualine_a_insert",
      --    inactive = "lualine_a_inactive",
      --  },
      --},
    },
    lualine_z = { 
      { "datetime",
        style = "%H:%M",
        icon = { "\u{f017}", align = "left" },
        color = custom_colour,
      },
    },
  },
}
