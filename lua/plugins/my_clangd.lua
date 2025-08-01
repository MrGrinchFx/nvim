return {
  -- This spec targets the nvim-lspconfig plugin
  "neovim/nvim-lspconfig",
  -- The opts function receives the existing options table for nvim-lspconfig
  -- and allows you to merge or override them.
  opts = {
    -- This 'servers' table is where you configure individual LSP servers.
    servers = {
      clangd = {
        -- Overwrite or extend the filetypes for clangd
        -- LazyVim might already have some, so list them all here
        -- to ensure CUDA types are included.
        filetypes = {
          "c",
          "cpp",
          "objc",
          "objcpp",
          "cuda", -- IMPORTANT: Add 'cuda' here
          "cu", -- Often used for CUDA source files
          "cuh", -- IMPORTANT: Add 'cuh' here
        },
        -- Clangd-specific settings go under the 'settings' key
        settings = {
          clangd = {
            -- Fallback flags are crucial if you're not using compile_commands.json
            -- These are passed directly to clangd
            fallbackFlags = {
              "-x",
              "cuda", -- Treat files as CUDA
              "-std=c++17", -- Or c++14, c++20, etc., matching your project
              "-I/usr/local/cuda/include", -- **Adjust this path to your CUDA toolkit installation!**
              -- Add other necessary include paths here if clangd can't find them, e.g.:
              -- "-I/usr/include/c++/11",
              -- "-I/usr/include/x86_64-linux-gnu/c++/11",
            },
            -- You can also add other clangd arguments here if needed
            -- arguments = {
            --   "--log=verbose",
            --   "--pretty=true",
            -- },
          },
        },
        -- If you need to specify a custom clangd executable path (e.g., if you installed
        -- a specific version or from source), you can do it here:
        -- cmd = { "/path/to/your/custom/clangd" },
      },
    },
  },
}
