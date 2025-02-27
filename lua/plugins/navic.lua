return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  config = function()
    local navic = require("nvim-navic")
    navic.setup({
      highlight = true,
      separator = " > ",
      depth_limit = 3, -- Número máximo de elementos a mostrar
    })

    -- Integrar con LSP
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end,
    })
  end,
}
