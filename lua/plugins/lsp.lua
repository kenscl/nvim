return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/nvim-cmp'},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"}, 
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            -- Ensure clangd is installed
            lsp.ensure_installed({
                'clangd',
            })

            -- Setup on_attach to configure keymaps
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                -- Add more keymaps or settings as needed
            end)

            -- Optional: Configure clangd-specific settings
            lsp.configure('clangd', {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                -- Add more options if needed
            })

            -- Setup LSP
            lsp.setup()

            -- nvim-cmp setup for autocompletion
            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            })

            -- Apply nvim-cmp settings
            lsp.setup_nvim_cmp({
                mapping = cmp_mappings
            })

            -- Mason setup (Optional)
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd' },
            })
        end
    }
}

