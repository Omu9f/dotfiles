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
      vim.keymap.set("n", "<A-u>", builtin.current_buffer_fuzzy_find, {}) -- search string across current file (buffer)
      vim.keymap.set("n", "<A-e>", builtin.live_grep, {})                 -- search string across project files
      vim.keymap.set("n", "<A-o>", function()
        require("telescope.builtin").buffers({ sort_lastused = true })
      end) -- list open buffers
      -- for more actions, use ':help telescope' in nvim
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
