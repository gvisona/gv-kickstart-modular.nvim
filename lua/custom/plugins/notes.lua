return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = 'Alexandria',
          path = '~/Obsidian/Alexandria',
          overrides = {
            notes_subdir = 'Zettelkasten',
            templates = {
              folder = 'Templates',
            },
            attachments = {
              folder = 'Files',
            },
          },
        },
        {
          name = 'WorkNotes',
          path = '~/Obsidian/WorkNotes',
          overrides = {
            notes_subdir = 'Notes',
            templates = {
              folder = 'Templates',
            },
            attachments = {
              folder = 'Images',
            },
          },
        },
      },
      new_notes_location = 'notes_subdir',

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date '%Y_%m_%d') .. '-' .. suffix
      end,

      -- Optional, customize how note file names are generated given the ID, target directory, and title.
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix '.md'
      end,

      ---@return table
      frontmatter = {
        func = function(note)
          -- Add the title of the note as an alias.
          if note.title then
            note:add_alias(note.title)
          end
          --
          local out = { id = note.id, aliases = note.aliases, tags = note.tags }
          --
          -- local out = {}
          -- `note.metadata` contains any manually added fields in the frontmatter.
          -- So here we just make sure those fields are kept in the frontmatter.
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end

          return out
        end,
        enabled = false,
      },

      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        -- folder = 'Files', -- This is the default

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        img_name_func = function()
          -- Prefix image names with timestamp.
          return string.format('%s-', os.time())
        end,

        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
      },
      --   mappings = {
      --     -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      --     ['gf'] = {
      --       action = function()
      --         return require('obsidian').util.gf_passthrough()
      --       end,
      --       opts = { noremap = false, expr = true, buffer = true },
      --     },
      --     -- Toggle check-boxes.
      --     ['<leader>ch'] = {
      --       action = function()
      --         return require('obsidian').util.toggle_checkbox()
      --       end,
      --       opts = { buffer = true },
      --     },
      --   },
    },
    config = function(plugin, opts)
      require('obsidian').setup(opts)
      vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new_from_template<cr>', { desc = 'New [O]bsidian [N]ote' })
      vim.keymap.set('n', '<leader>so', '<cmd>Obsidian search<cr>', { desc = '[S]earch [O]bsidian notes' })
      vim.keymap.set('n', '<leader>os', '<cmd>Obsidian quick_switch<cr>', { desc = '[O]bsidian quick [S]witch' })
      vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian backlinks<cr>', { desc = 'Location list of [O]bsidian [B]acklinks' })
      vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian template<cr>', { desc = '[O]bsidian [T]emplate' })
      vim.keymap.set('n', '<leader>oi', '<cmd>Obsidian paste_img<cr>', { desc = '[O]bsidian paste [I]mage' })
    end,
  },
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  {
    -- If some packages are missing, go the the install folder (e.g. `.local/share/nvim/lazy/markdown-preview.nvim`)
    -- and run `npm install`
    'iamcco/markdown-preview.nvim', -- requires the '@chemzqm/neovim' node module
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      {
        '<leader>mp',
        ft = 'markdown',
        '<cmd>MarkdownPreviewToggle<cr>',
        desc = '[M]arkdown [P]review',
      },
    },
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
      dirs = {
        ['~/Obsidian/Alexandria'] = {
          -- template = 'template for this project',

          dir_path = 'Files',
          -- filetypes = { -- filetype options nested inside dirs
          --   markdown = {
          --     template = 'markdown template',
          --   },
          -- },
          --
          -- files = { -- file options nested inside dirs
          --   ['readme.md'] = {
          --   },
          -- },
        },
        ['~/Obsidian/WorkNotes'] = {
          -- template = 'template for this project',

          dir_path = 'Images',
          -- filetypes = { -- filetype options nested inside dirs
          --   markdown = {
          --     template = 'markdown template',
          --   },
          -- },
          --
          -- files = { -- file options nested inside dirs
          --   ['readme.md'] = {
          --   },
          -- },
        },
      },
    },
    keys = {
      -- suggested keymap
      { '<leader>np', '<cmd>PasteImage<cr>', desc = '[N]ote [P]aste image from system clipboard' },
    },
  },
}
