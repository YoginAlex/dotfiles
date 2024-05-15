return {
  -- Disable default Tab Key mappings in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        -- Press Tab to autocomplete
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<ESC>"] = cmp.mapping.close(),

        ["<ESC>"] = cmp.mapping({
          -- i = cmp.mapping.abort(),
          c = function()
            if cmp.visible() then
              cmp.close()
            else
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<C-c>", true, true, true),
                "n",
                true
              )
            end
          end,
        }),

        ["<C-f>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ["<C-CR>"] = function(fallback)
        --   cmp.abort()
        --   fallback()
        -- end,
      })

      opts.window = {
        completion = cmp.config.window.bordered({
          scrollbar = false,
          -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
      }
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
}
