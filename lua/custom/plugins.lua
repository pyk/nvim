local plugins = {
  -- [[ Syntax highlighter ]]
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "astro",
        -- "vue", "svelte",
        --

        -- writing
        "markdown",

        "solidity",
        -- low level
        -- "c",
        -- "zig"
      },
      autotag = {enable = true}
    }
  },

  -- [[ Binary package manager ]]
  -- Useful for installing lsp, formatter & linter
  {
    "williamboman/mason.nvim",
    dependencies = {
      {"williamboman/mason-lspconfig.nvim", opts = {}},
    },
    opts = {
      ensure_installed = {}
    }
  },

  -- [[ lsp server runner ]]
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },


  -- [[ Linter runner ]]
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.linter"
    end
  },

  -- [[ Formatter runner ]]
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = function ()
      return require "custom.configs.formatter"
    end
  },

  -- [[ Others ]]

   {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('nvim-ts-autotag').setup({
        -- your config
      })
    end,
    lazy = true,
    event = "VeryLazy"
  },
  }


return plugins
