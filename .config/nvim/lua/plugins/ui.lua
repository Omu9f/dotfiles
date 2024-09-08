return {
    {
        "nvimdev/dashboard-nvim",
        enabled = false,
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
    },

    -- neo-tree to disable it on nvim . (there's probably better ways to do this)
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            filesystem = {
                hijack_netrw_behavior = "disabled", -- Disable hijacking so Neo-tree doesn't open automatically
            }
        end
    },

    -- nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")

                    local function opts(desc)
                        return {
                            desc = "nvim-tree: " .. desc,
                            buffer = bufnr,
                            noremap = true,
                            silent = true,
                            nowait = true,
                        }
                    end

                    -- default mappings
                    api.config.mappings.default_on_attach(bufnr)

                    -- custom mappings
                    vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
                end,
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                    relativenumber = true,
                },
                renderer = {
                    group_empty = false,
                    icons = {
                        git_placement = "signcolumn",
                        show = {
                            git = true,
                            folder = true,
                            file = true,
                            folder_arrow = true,
                        },
                        glyphs = {
                            default = "", -- Default file icon
                            symlink = "",
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                filters = {
                    dotfiles = true,
                    custom = {
                        "node_modules/.*",
                    },
                },
                log = {
                    enable = true,
                    truncate = true,
                    types = {
                        diagnostics = true,
                        git = true,
                        profile = true,
                        watcher = true,
                    },
                },
            })

            if vim.fn.argc(-1) == 0 then
                vim.cmd("NvimTreeFocus")
            end
        end,
    },
}
