local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.95,
      -- prompt_position = 'top',
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    extension_name = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
    -- please take a look at the readme of the extension you want to configure
  }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('coc')

-- local M = {}
-- M.search_dot_files = function()
--   require("telescope.builtin").find_files({
--     prompt_title = "< VimRC >",
--     cwd = "~/.config/nvim/",
--   })
-- end
-- return M
