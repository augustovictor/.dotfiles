lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",
  -- auto_close = true,
  --  vimrc
  renderer.indent_markers.enable = 1, -- 0 by default, this option shows indent markers when folders are open
  renderer.highlight_git = 1, -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
  renderer.highlight_opened_files = 1, -- 0 by default, will enable folder and file icon highlight for opened files/directories.
  renderer.root_folder_modifier = ',:~' -- This is the default. See :help filename-modifiers for more options
  renderer.add_trailing = 1, -- 0 by default, append a trailing slash to folder names
  renderer.group_empty = 1, --  0 by default, compact folders that only contain a single folder into one node in the file tree
  actions.open_file.window_picker.enable = 1, -- 0 by default, will disable the window picker.
  renderer.icons.padding = ', ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
  renderer.icons.symlink_arrow = ', >> ' --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
  respect_buf_cwd = 1, -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  create_in_closed_folder = 0, -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
  actions.open_file.window_picker.exclude = {
        filetype: [
          notify,
          packer,
          'qf'
        ],
        buftype: [
          "terminal"
         
   },
  renderer.special_files = { "README.md": 1, "Makefile": 1, "MAKEFILE": 1 }, -- List of filenames that gets highlighted with NvimTreeSpecialFile
  renderer.icons.show = {
       git:1,
       folders 1,
       files: 1,
       folder_arrow: 1,
   },
  renderer.icons.gyphs = {
     default: '',
     symlik: '',
    git: {
       unstged: "✗",
       saged: "✓",
       unerged: "",
       enamed: "➜",
       utracked: "★",
      deleted: "",
      ignord: "◌"
      },
     folder: {
      arrow_open: "",
      arrow_closed: "",
      default: "",
       open: "",
       empty: "",
      empty_open: "",
       symlink: "",
      ymlink_open: "",
       }
     },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#E5C07B",
      "#E06C75",
      "#98C379",
      "#56B6C2",
      "#61AFEF",
      "#C678DD",
      }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "<S-L>",
      scope_incremental = "grc",
      node_decremental = "<S-H>",
    },
  },
  indent = {
    enable = true
  },
}

require'nvim-tree'.setup()
EOF
