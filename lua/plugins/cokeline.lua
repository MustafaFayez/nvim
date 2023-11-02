return{
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "kyazdani42/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
  -- config = true
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    -- local get_hex = require('cokeline/utils').get_hex
    local is_picking_focus = require('cokeline.mappings').is_picking_focus
    local is_picking_close = require('cokeline.mappings').is_picking_close
    local yellow = vim.g.terminal_color_3
    local red = vim.g.terminal_color_1

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return
          buffer.is_focused
          and get_hex('ColorColumn', 'bg')
          or get_hex('Normal', 'fg')
        end,
        -- bg = function() return get_hex('ColorColumn', 'bg') end,
        bg = function(buffer)
          return
          buffer.is_focused
          and get_hex('Normal', 'fg')
          or get_hex('ColorColumn', 'bg')
        end,
      },


      sidebar = {
        filetype = {'NvimTree', 'neo-tree'},
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
            italic = true,

          },
        }
      },

      components = {
        {
          text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
        },
        {
          text = '  ',
        },
        -- {
        --   text = function(buffer)
        --     return buffer.devicon.icon
        --   end,
        --   fg = function(buffer)
        --     return buffer.devicon.color
        --   end,
        -- },
        {
          text = function(buffer)
            return
              (is_picking_focus() or is_picking_close())
              and buffer.pick_letter .. ' '
               or buffer.devicon.icon
          end,
          fg = function(buffer)
            return
              (is_picking_focus() and yellow)
              or (is_picking_close() and red)
              or buffer.devicon.color
          end,
          italic = function()
            return
              (is_picking_focus() or is_picking_close())
          end,
          bold = function()
            return
              (is_picking_focus() or is_picking_close())
          end
        },
        {
          text = ' ',

        },
        -- {
        --   text = function(buffer) return buffer.filename .. '  ' end,
        --   bold = function(buffer)
        --     return buffer.is_focused
        --   end,
        --   italic = function(buffer)
        --     return buffer.is_focused
        --   end,
        -- },
        {
          text = function(buffer) return buffer.filename end,
          hl = {
            fg = function(buffer)
              if buffer.lsp.errors ~= 0 then
                return vim.g.terminal_color_1 -- red
              end
              if buffer.lsp.warnings ~= 0 then
                return vim.g.terminal_color_3 -- yellow
              end
            end,

            style = function(buffer)
              local style
              if buffer.is_focused then
                style = 'bold'
              end

              if buffer.lsp.errors ~= 0 then
                if style then
                  style = style .. ',underline'
                else
                  style = 'underline'
                end
              end
              return style
            end,
          },
          bold = function(buffer)
            return buffer.is_focused
          end,
          italic = function(buffer)
            return buffer.is_focused
          end,
        },
        {
          text = function(buffer) return buffer.is_modified and " ⬤" or " " end
        },
        -- {
        --   text = '',
        --   on_click = function(_, _, _, _, buffer)
        --     buffer:delete()
        --
        --   end,
        -- },
        {

          text = '  ',
        },
      },
    })
  end,
}
