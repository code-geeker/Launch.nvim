--- lsp.lua - Language Server Protocol integration
--
-- Author:  NTBBloodbath <bloodbathalchemist@protonmail.com>
-- URL:     https://github.com/NTBBloodbath/nvim
-- License: GPLv3
--
--- Code:

-- I don't need to do anything if I'm not editing a file that I have an LSP configured for
-- NOTE: I am managing rust-analyzer through rustaceanvim but I still load my lsp module on Rust files
-- so stuff like my diagnostics configurations, LSP UI improvements and keybindings still work on them
--[[ if
  not vim
    .iter({ "c", "cpp", "zig", "rs", "ex", "exs", "nix", "lua", "py", "js", "ts", "css", "html", "svelte", "php" })
    :find(vim.fn.expand("%:e"))
then
  return
end ]]

--[[ -- Diagnostics {{{
local severity = vim.diagnostic.severity
vim.diagnostic.config({
  underline = {
    severity = {
      min = severity.WARN,
    },
  },
  signs = {
    severity = {
      min = severity.WARN,
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
    },
  },
  virtual_text = false,
  -- virtual_lines = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "if_many",
    border = "rounded",
    show_header = false,
  },
})
-- }}} ]]


-- 定义诊断图标（强制锁定）
local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 配置诊断行为
vim.diagnostic.config({
  signs = { severity = { min = vim.diagnostic.severity.WARN } }, -- 仅显示 WARN/ERROR
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  update_in_insert = false,  -- 关键：禁用插入模式更新
  severity_sort = true,
  float = { border = "rounded" }
})


-- Improve LSPs UI {{{
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded", close_events = { "CursorMoved", "BufHidden", "InsertCharPre" } }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded", close_events = { "CursorMoved", "BufHidden" } }
)

local icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Keyword = " ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

local completion_kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(completion_kinds) do
  completion_kinds[i] = icons[kind] and icons[kind] .. kind or kind
end
-- }}}

-- Lsp capabilities {{{
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}
capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

local loaded_blink, blink = xpcall(require, debug.traceback, "blink.cmp")
if loaded_blink then
  ---@diagnostic disable-next-line undefined-field
  capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", {
  capabilities = capabilities,
})
-- }}}

-- Servers {{{

  -- PHP {{{
    vim.lsp.config.intelephense = {
      cmd = { "intelephense", "--stdio" },
      root_markers = {
        'composer.json',
        '.git',
        'index.php',
        'artisan',
        'phpunit.xml',
        'phpunit.xml.dist'
      },
      filetypes = {"php"},

      settings = {
        intelephense = {
          files = {
            maxSize = 90000000,
          },
          diagnostics = {
            undefinedTypes = false,
            undefinedFunctions = false,
            undefinedConstants = false,
            undefinedClassConstants = false,
            undefinedMethods = false,
            undefinedProperties = false,
            undefinedVariables = true,
            typeErrors = false,
            unusedSymbols = false,
          }
        },
      },
    }
    vim.lsp.enable("intelephense")
      -- }}}
  -- Lua {{{
    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".git", vim.uv.cwd() },
      settings = {
        Lua = {
          telemetry = {
            enable = false,
          },
        },
      },
    }
    vim.lsp.enable("lua_ls")
      -- }}}

  -- Python {{{
    vim.lsp.config.basedpyright = {
      name = "basedpyright",
      filetypes = { "python" },
      cmd = { "basedpyright-langserver", "--stdio" },
      settings = {
        python = {
          venvPath = vim.fn.expand("~") .. "/.virtualenvs",
        },
        basedpyright = {
          disableOrganizeImports = true,
          analysis = {
            autoSearchPaths = true,
            autoImportCompletions = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "strict",
            inlayHints = {
              variableTypes = true,
              callArgumentNames = true,
              functionReturnTypes = true,
              genericTypes = false,
            },
          },
        },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
        local ok, venv = pcall(require, "rj.extras.venv")
        if ok then
        venv.setup()
        end
        local root = vim.fs.root(0, {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git",
            vim.uv.cwd(),
            })
        local client =
        vim.lsp.start(vim.tbl_extend("force", vim.lsp.config.basedpyright, { root_dir = root }), { attach = false })
        if client then
        vim.lsp.buf_attach_client(0, client)
          end
          end,
    })
    -- }}}

  -- Go {{{
    vim.lsp.config.gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gotempl", "gowork", "gomod" },
      root_markers = { ".git", "go.mod", "go.work", vim.uv.cwd() },
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
          ["ui.inlayhint.hints"] = {
            compositeLiteralFields = true,
            constantValues = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    }
    vim.lsp.enable("gopls")
      -- }}}

  -- C/C++ {{{
    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "-j=" .. 2,
        "--background-index",
        "--clang-tidy",
        "--inlay-hints",
        "--fallback-style=llvm",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--header-insertion-decorators",
        "--pch-storage=memory",
      },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      root_markers = {
        "CMakeLists.txt",
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
        vim.uv.cwd(),
      },
    }
    vim.lsp.enable("clangd")
      -- }}}

  -- Rust {{{
    vim.lsp.config.rust_analyzer = {
      filetypes = { "rust" },
      cmd = { "rust-analyzer" },
      workspace_required = true,
      root_dir = function(buf, cb)
        local root = vim.fs.root(buf, { "Cargo.toml", "rust-project.json" })
        local out = vim.system({ "cargo", "metadata", "--no-deps", "--format-version", "1" }, { cwd = root }):wait()
                                                                                                              if out.code ~= 0 then
                                                                                                                return cb(root)
                                                                                                                  end

                                                                                                                  local ok, result = pcall(vim.json.decode, out.stdout)
                                                                                                                  if ok and result.workspace_root then
                                                                                                                    return cb(result.workspace_root)
                                                                                                                      end

                                                                                                                      return cb(root)
                                                                                                                      end,
                                                                                                                      settings = {
                                                                                                                        autoformat = false,
                                                                                                                        ["rust-analyzer"] = {
                                                                                                                          check = {
                                                                                                                            command = "clippy",
                                                                                                                          },
                                                                                                                        },
                                                                                                                      },
    }
    vim.lsp.enable("rust_analyzer")
      -- }}}

  -- Typst {{{
    vim.lsp.config.tinymist = {
      cmd = { "tinymist" },
      filetypes = { "typst" },
      root_markers = { ".git", vim.uv.cwd() },
    }

    vim.lsp.enable("tinymist")
      -- }}}

  -- Bash {{{
    vim.lsp.config.bashls = {
      cmd = { "bash-language-server", "start" },
      filetypes = { "bash", "sh", "zsh" },
      root_markers = { ".git", vim.uv.cwd() },
      settings = {
        bashIde = {
          globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
        },
      },
    }
    vim.lsp.enable("bashls")
      -- }}}

  -- Web-dev {{{
    -- TSServer {{{
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },

        init_options = {
          hostInfo = "neovim",
        },
      }
      -- }}}

    -- CSSls {{{
      vim.lsp.config.cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss" },
        root_markers = { "package.json", ".git" },
        init_options = {
          provideFormatter = true,
        },
      }
      -- }}}

    -- TailwindCss {{{
      vim.lsp.config.tailwindcssls = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = {
          "ejs",
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        root_markers = {
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts",
          "package.json",
          "node_modules",
        },
        settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            includeLanguages = {
              eelixir = "html-eex",
              eruby = "erb",
              htmlangular = "html",
              templ = "html",
            },
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning",
            },
            validate = true,
          },
        },
      }
      -- }}}

    -- HTML {{{
      vim.lsp.config.htmlls = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },

        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
          provideFormatter = true,
        },
      }
      -- }}}

    vim.lsp.enable({ "ts_ls", "cssls", "tailwindcssls", "htmlls" })

      -- }}}

  -- }}}

-- Disable default keybinds {{{
for _, bind in ipairs({ "grn", "gra", "gri", "grr" }) do
  vim.keymap.del("n", bind)
end
-- }}}

-- Create keybindings, commands and autocommands on LSP attach {{{
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --- Set omnifunc completion and use LSP for finding tags whenever possible
    ---@diagnostic disable-next-line need-check-nil
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    ---@diagnostic disable-next-line need-check-nil
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    --- Disable semantic tokens
    ---@diagnostic disable-next-line need-check-nil
    client.server_capabilities.semanticTokensProvider = nil

    --[[ --- Keybindings
    local kbd = vim.keymap.set
    -- Show documentation
    kbd("n", "<leader>lh", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover documentation" })
    -- Open code actions
    kbd("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
    -- Rename symbol under cursor
    kbd("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    -- Show line diagnostics
    kbd("n", "<leader>ldl", function()
      vim.diagnostic.open_float({
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "if_many",
        prefix = " ",
        scope = "cursor",
      })
    end, { buffer = bufnr, desc = "Show line diagnostics" })
    -- Go to diagnostics
    kbd(
      "n",
      "<leader>ldp",
      vim.diagnostic.goto_prev,
      { buffer = bufnr, desc = "Goto next diagnostic" }
    )
    kbd(
      "n",
      "<leader>ldn",
      vim.diagnostic.goto_next,
      { buffer = bufnr, desc = "Goto prev diagnostic" }
    )
    -- Go to definition
    kbd("n", "<leader>lgd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto definition" })
    -- Go to declaration
    kbd("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto declaration" }) ]]

    --- Autocommands
    vim.api.nvim_create_augroup("Lsp", { clear = true })
    -- Display line diagnostics on hover
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   group = "Lsp",
    --   buffer = bufnr,
    --   callback = function()
    --     local opts = {
    --       focusable = false,
    --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --       border = "rounded",
    --       source = "always",
    --       prefix = " ",
    --       scope = "line",
    --     }
    --     vim.diagnostic.open_float(opts)
    --   end,
    -- })
    -- Fix all eslint offenses on save in JavaScript/TypeScript files
    ---@diagnostic disable-next-line need-check-nil
    if client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "Lsp",
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end

    --- Commands
    -- Format
    vim.api.nvim_create_user_command(
      "LspFormat",
      vim.lsp.buf.format,
      { desc = "Format current buffer using LSP" }
    )
  end,
})
-- }}}

-- Global commands (start, stop, restart, etc) {{{
-- rust-analyzer is handled by rustaceanvim so we save some time ignoring it
if vim.fn.expand("%:e") ~= "rs" then
  -- Start {{{
  vim.api.nvim_create_user_command("LspStart", function()
    vim.cmd.e()
  end, { desc = "Starts LSP clients in the current buffer" })
  -- }}}

  -- Stop {{{
  vim.api.nvim_create_user_command("LspStop", function(opts)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      if opts.args == "" or opts.args == client.name then
        client:stop(true)
        vim.notify("[core.lsp] " .. client.name .. ": stopped")
      end
    end
  end, {
    desc = "Stop all the LSP clients or a specific client attached to the current buffer.",
    nargs = "?",
    complete = function(_, _, _)
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      local client_names = {}
      for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
      end
      return client_names
    end,
  })
  -- }}}

  -- Restart {{{
  vim.api.nvim_create_user_command("LspRestart", function()
    local detach_clients = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      client:stop(true)
      if vim.tbl_count(client.attached_buffers) > 0 then
        detach_clients[client.name] = { client, vim.lsp.get_buffers_by_client_id(client.id) }
      end
    end
    local timer = vim.uv.new_timer()
    timer:start(
      100,
      50,
      vim.schedule_wrap(function()
        for name, client in pairs(detach_clients) do
          local client_id = vim.lsp.start(client[1].config, { attach = false })
          if client_id then
            for _, buf in ipairs(client[2]) do
              vim.lsp.buf_attach_client(buf, client_id)
            end
            vim.notify("[core.lsp] " .. name .. ": restarted")
          end
          detach_clients[name] = nil
        end
        if next(detach_clients) == nil and not timer:is_closing() then
          timer:close()
        end
      end)
    )
  end, {
    desc = "Restart all the LSP clients attached to the current buffer",
  })
  -- }}}

  -- Log {{{
  vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd.vsplit(vim.lsp.log.get_filename())
  end, { desc = "Get all the LSP logs" })
  -- }}}

  -- Info {{{
  vim.api.nvim_create_user_command("LspInfo", function()
    vim.cmd("silent checkhealth vim.lsp")
  end, { desc = "Get all the information about all LSP attached" })
  -- }}}
end
-- }}}

-- vim: fdm=marker:fdl=0
--- lsp.lua ends here
