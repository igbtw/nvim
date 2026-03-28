return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = {
      bg0 = "#161616",
      bg1 = "#262626",
      bg2 = "#393939",
      blue = "#78a9ff",
      cyan = "#33b1ff",
      green = "#42be65",
      yellow = "#ffe97b",
      red = "#ee5396",
      purple = "#be95ff",
      fg = "#f2f4f8",
    }

    local theme = {
      normal = {
        a = { fg = colors.bg0, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg2 },
        c = { fg = colors.fg, bg = colors.bg1 },
      },
      insert = { a = { fg = colors.bg0, bg = colors.green, gui = "bold" } },
      visual = { a = { fg = colors.bg0, bg = colors.purple, gui = "bold" } },
      replace = { a = { fg = colors.bg0, bg = colors.red, gui = "bold" } },
      command = { a = { fg = colors.bg0, bg = colors.yellow, gui = "bold" } },
      inactive = {
        a = { fg = colors.bg2, bg = colors.bg1 },
        b = { fg = colors.bg2, bg = colors.bg1 },
        c = { fg = colors.bg2, bg = colors.bg0 },
      },
    }

    return {
      options = {
        theme = theme,
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "snacks_dashboard" },
        },
        section_separators = { left = "\u{e0b0}", right = "\u{e0b2}" },
        component_separators = { left = "\u{e0b1}", right = "\u{e0b3}" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local icons = {
                NORMAL = "󰋜 NORMAL",
                INSERT = " INSERT",
                VISUAL = "󰈈 VISUAL",
                ["V-LINE"] = "󰈈 V-LINE",
                ["V-BLOCK"] = "󰈈 V-BLOCK",
                COMMAND = " COMMAND",
                REPLACE = "󰬲 REPLACE",
                TERMINAL = " TERMINAL",
              }
              return icons[str] or str
            end,
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = " ●", readonly = " ", unnamed = " ∅" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " },
          },
          {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              if #clients == 0 then
                return "󰅚 no lsp"
              end
              local names = {}
              for _, c in ipairs(clients) do
                table.insert(names, c.name)
              end
              return "󰒋 " .. table.concat(names, ", ")
            end,
          },
          { "filetype" },
          { "encoding", icon = "󰉿" },
        },
        lualine_y = {
          { "progress", icon = "󰦨" },
          { "location", icon = "" },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%H:%M")
            end,
          },
        },
      },
      extensions = { "neo-tree", "lazy", "trouble" },
    }
  end,
}
