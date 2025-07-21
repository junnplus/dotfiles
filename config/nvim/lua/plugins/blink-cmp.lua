return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<C-e>'] = {},
    },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal'
    },
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'kind_icon',  'kind',              gap = 1 },
            { 'label',      'label_description', gap = 1 },
            { 'source_name' }
          }
        }
      },
      documentation = { auto_show = true, window = { border = 'rounded' } }
    },
    signature = { window = { border = 'rounded' } },

    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lsp = {
          name = 'LSP',
          module = 'blink.cmp.sources.lsp',
          enabled = true,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      sorts = { 'sort_text', 'score', },
    }
  },
  opts_extend = { 'sources.default' }
}
