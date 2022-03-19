lua <<EOF
require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]c"] = "@class.outer",
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]C"] = "@class.outer",
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[c"] = "@class.outer",
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[C"] = "@class.outer",
        ["[]"] = "@function.outer",
      },
    },
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },

  endwise = {
      enable = true,
  },

  autotag = {
    enable = true,
  },
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = { 'org' },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'org' },
  },
}
EOF
