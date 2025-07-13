return {
  { -- add extra config to clangd
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = { "clangd", "--clang-tidy" },
          filetypes = { "c", "cpp", "cuda" },
          -- attach .cuh override as before:
          on_attach = function(client, bufnr)
            local filename = vim.api.nvim_buf_get_name(bufnr)
            if filename:match("%.cuh$") then
              client.handlers["textDocument/publishDiagnostics"] = function() end
            end
          end,
        },
      },
    },
  },
}
