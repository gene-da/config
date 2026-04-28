return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
      {
        'folke/snacks.nvim',
        opts = {
          picker = { enabled = true },
        },
      },
    },

    config = function()
      -- Safe require (prevents crash if Snacks loads late)
      local ok, snacks = pcall(require, 'snacks')
      local picker = ok and snacks.picker or nil

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, {
              buffer = event.buf,
              desc = desc,
            })
          end

          if picker then
            map('<leader>cd', picker.lsp_definitions, 'Goto Definition')
            map('<leader>cr', picker.lsp_references, 'References')
            map('<leader>ci', picker.lsp_implementations, 'Implementation')
            map('<leader>ct', picker.lsp_type_definitions, 'Type Definition')

            map('<leader>cs', picker.lsp_symbols, 'Document Symbols')
            map('<leader>cS', picker.lsp_workspace_symbols, 'Workspace Symbols')
          else
            -- Fallback (so you’re not dead in the water)
            map('<leader>cd', vim.lsp.buf.definition, 'Goto Definition')
            map('<leader>cr', vim.lsp.buf.references, 'References')
            map('<leader>ci', vim.lsp.buf.implementation, 'Implementation')
            map('<leader>ct', vim.lsp.buf.type_definition, 'Type Definition')
          end

          map('<leader>cD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('K', vim.lsp.buf.hover, 'Hover Docs')
          map('<leader>crn', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end

          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Toggle Inlay Hints')
          end
        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        virtual_text = {
          spacing = 2,
          source = 'if_many',
        },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        clangd = {
          cmd = {
            'clangd',
            '--function-arg-placeholders',
            '--background-index',
            '--clang-tidy',
            '--completion-style=detailed',
          },
        },
        pyright = {},
        zls = {},
        bashls = {},
        jsonls = {},
        taplo = {},
        texlab = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, { 'stylua' })

      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
