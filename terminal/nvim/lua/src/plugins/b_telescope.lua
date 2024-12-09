-- telescope for fuzzy finding files, strings, etc
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "target",
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<A-l>", builtin.find_files, {})                -- search for file names
      vim.keymap.set("n", "<A-f>", builtin.current_buffer_fuzzy_find, {}) -- search string across current file (buffer)
      vim.keymap.set("n", "<leader>pf", builtin.live_grep, {})            -- search string across project files
      vim.keymap.set("n", "<leader>o", function()
        require("telescope.builtin").buffers({ sort_lastused = true })
      end) -- list open buffers
      vim.keymap.set("n", "<C-m>", function()
        require("telescope.builtin").buffers({ sort_lastused = true })
        -- Delay the Enter key press slightly to allow Telescope to open
        vim.defer_fn(function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "i", false)
        end, 5) -- Delay for 5ms (adjust as necessary)
      end)      -- simulate harpoon, switch to last open buffer
      -- for more actions, use ':help telescope' in nvim
      -- add more actions here...
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
