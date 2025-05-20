return {
  'junnplus/lsp-setup.nvim',
  -- dir = '/Users/jun/Documents/workspace/lsp-setup.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
  },
  init = function()
    -- vim.lsp.set_log_level('debug')
    -- require('vim.lsp.log').set_format_func(vim.inspect)

    local rounded = { border = 'rounded' }
    vim.diagnostic.config({ float = rounded })
    local hover = vim.lsp.buf.hover;
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.buf.hover = function()
      return hover({
        border = 'rounded',
        -- max_width = 100,
        max_width = math.floor(vim.o.columns * 0.7),
        max_height = math.floor(vim.o.lines * 0.7),
      })
    end
    --- TODO: remove it after new version of gopls is released (> v0.18.1)
    --- Issue: https://github.com/golang/go/issues/72742
    local code_action = vim.lsp.buf.code_action;
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.buf.code_action = function()
      return code_action({
        filter = function(ca)
          if ca.kind == 'gopls.doc.features' then
            return false
          end
          return true
        end,
      })
    end
  end,
  ---@module 'lsp-setup'
  ---@type LspSetup.Options
  opts = {
    mappings = {
      gd = { cmd = function() require('telescope.builtin').lsp_definitions() end, opts = { desc = 'Go To Definition' } },
      gi = { cmd = function() require('telescope.builtin').lsp_implementations() end, opts = { desc = 'Go To Implementation' } },
      gr = { cmd = function() require('telescope.builtin').lsp_references() end, opts = { desc = 'Go To References' } },
    },
    inlay_hints = {
      enabled = true,
      -- debug = true,
    },
    servers = {
      pylsp = {
        settings = {
          pylsp = {
            -- :PylspInstall python-lsp-black
            -- :PylspInstall pyls-isort
            -- :PylspInstall python-lsp-ruff
            configurationSources = { 'flake8' },
            plugins = {
              pycodestyle = {
                enabled = false,
              },
              mccabe = {
                enabled = false,
              },
              pyflakes = {
                enabled = false,
              },
              flake8 = {
                enabled = true,
                args = { '--ignore=E501' }
              },
              pylint = {
                enabled = false,
              },
              black = {
                enabled = true,
              },
              rope_autoimport = {
                enabled = true,
              },
            }
          }
        }
      },
      yamlls = {
        settings = {
          yaml = {
            keyOrdering = false
          }
        }
      },
      zk = {},
      jsonls = {},
      bashls = {},
      ts_ls = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          },
        }
      },
      -- denols = {},
      clojure_lsp = {},
      jsonnet_ls = {},
      zls = {
        -- cmd = { '/Users/jun/Documents/workspace/zls/zig-out/bin/zls', '--enable-debug-log' },
        settings = {
          zls = {
            enable_inlay_hints = true,
            inlay_hints_show_builtin = true,
            inlay_hints_exclude_single_argument = true,
            inlay_hints_hide_redundant_param_names = true,
            inlay_hints_hide_redundant_param_names_last_token = true,
          }
        }
      },
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            -- staticcheck = true,
            usePlaceholders = true,
            codelenses = {
              gc_details = true,
            },
            hints = {
              rangeVariableTypes = true,
              parameterNames = true,
              constantValues = true,
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              functionTypeParameters = true,
            },
          },
        },
      },
      buf_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              checkThirdParty = false,
            },
            hint = {
              enable = true,
              arrayIndex = 'Disable',
            },
          }
        }
      },
      sqls = {},
      ['rust_analyzer'] = {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              disabled = { 'unresolved-proc-macro' },
            },
            cargo = {
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
            },
            inlayHints = {
              closureReturnTypeHints = {
                enable = true
              },
            },
            cache = {
              warmup = false,
            }
          },
        },
      }
    }
  },
}
