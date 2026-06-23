{pkgs, ...}: {
  programs.lazyvim = {
    enable = true;

    installCoreDependencies = true;
    extras = {
      lang.nix = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
      lang.python.enable = true;
      lang.go = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
    };

    extraPackages = with pkgs; [
      #Lsps
      nixd
      alejandra

      pyright
      gopls
      lua-language-server

      #linters
      statix
      ruff
    ];
    config = {
      options = ''
                -- Options are automatically loaded before lazy.nvim startup
        -- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
        -- Add any additional options here
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
        vim.opt.statuscolumn = ""
        vim.opt.termguicolors = true
      '';
      keymaps = ''
        -- Move current line down (Ctrl + j)
        vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>", { noremap = true, silent = true })

        -- Move current line up (Ctrl + k)
        vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>", { noremap = true, silent = true })

        -- Move selected lines down (Ctrl + j in Visual mode)
        vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv", { noremap = true, silent = true })

        -- Move selected lines up (Ctrl + k in Visual mode)
        vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv", { noremap = true, silent = true })

        -- Resize terminal and window splits using Ctrl + Arrow keys
        -- Increase window height (Ctrl + Up)
        vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })

        -- Decrease window height (Ctrl + Down)
        vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })

        -- Decrease window width (Ctrl + Left)
        vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

        -- Increase window width (Ctrl + Right)
        vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

        -- Seamless pane navigation in Normal & Insert mode using Ctrl + Alt + h/j/k/l
        local opts = { noremap = true, silent = true }

        -- Move to the left pane
        vim.keymap.set({ "n", "i" }, "<C-M-h>", "<C-\\><C-n><C-w>h", opts)

        -- Move to the down pane
        vim.keymap.set({ "n", "i" }, "<C-M-j>", "<C-\\><C-n><C-w>j", opts)

        -- Move to the up pane
        vim.keymap.set({ "n", "i" }, "<C-M-k>", "<C-\\><C-n><C-w>k", opts)

        -- Move to the right pane
        vim.keymap.set({ "n", "i" }, "<C-M-l>", "<C-\\><C-n><C-w>l", opts)

        -- CTRL + ALT + I --> ESC
        -- Map ESC to exit terminal mode
        vim.keymap.set("i", "<C-M-i>", "<Esc>", { noremap = true, silent = true })
      '';
    };
    plugins = {
      snacks = ''
              return {
          "snacks.nvim",
          opts = {
            dashboard = {
              preset = {
                pick = function(cmd, opts)
                  return LazyVim.pick(cmd, opts)()
                end,
                header = [[
         ██████╗       ██╗     ██╗███╗   ██╗███████╗██████╗
        ██╔════╝       ██║     ██║████╗  ██║██╔════╝██╔══██╗
        ██║  ███╗█████╗██║     ██║██╔██╗ ██║█████╗  ██████╔╝
        ██║   ██║╚════╝██║     ██║██║╚██╗██║██╔══╝  ██╔══██╗
        ╚██████╔╝      ███████╗██║██║ ╚████║███████╗██║  ██║
         ╚═════╝       ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
         ]],
                -- stylua: ignore
                ---@type snacks.dashboard.Item[]
                keys = {
                  { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                  { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                  { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                  { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                  { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
              },
            },
          },
        }

      '';
      nvimtree = ''
                return {
          "nvim-tree/nvim-tree.lua",
          dependencies = { "nvim-tree/nvim-web-devicons" },
          config = function()
            require("nvim-tree").setup()
            -- Keybinding to toggle NvimTree
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
          end,
        }
      '';
      lualine = ''
                return {
          "nvim-lualine/lualine.nvim",
          event = "VeryLazy",
          opts = {
            options = { ... }, -- your existing options
            sections = {
              lualine_a = { "mode" },
              lualine_b = {},
              lualine_c = { "filename" },
              lualine_x = {},
              lualine_y = {},
              lualine_z = {
                function()
                  local line = vim.fn.line(".")
                  local total = vim.fn.line("$")
                  return line .. "/" .. total -- example: 7/25
                  -- or: return "Ln " .. line .. "/" .. total
                  -- or: return vim.fn.printf("%d:%d", line, vim.fn.col("."))
                end,
              },
            },
            -- inactive_sections as before
          },
        }
      '';
      bg = ''
                return {
          "typicode/bg.nvim",
          lazy = false, -- important
        }

      '';
      lsp-config = ''
        return {
          "neovim/nvim-lspconfig",
          opts = function(_, opts)
            opts.servers = opts.servers or {}
            opts.servers.nixd = {
              cmd = { "nixd" },
              settings = {
                nixd = {
                  nixpkgs = {
                    expr = "import <nixpkgs> { }",
                  },
                  formatting = {
                    command = { "alejandra" },
                  },
                },
              },
            }
            return opts
          end,
        }

      '';
      colorscheme = ''
        return {
          {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = function()
                vim.cmd.colorscheme("habamax")
              end,
            },
          },
        }
      '';
      yazi = ''
        return {
          "mikavilpas/yazi.nvim",
          event = "VeryLazy",
          keys = {
            {
              "<leader>m",
              "<cmd>Yazi<CR>",
              desc = "Open Yazi",
            },
          },
        }
      '';
    };
  };
}
