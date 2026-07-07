return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    --@module "neo-tree"
    --@type neotree.Config?
    config = function()
      vim.keymap.set("n", "<leader>n", function()
        -- Checks whether the buffer you're currently in is the neo-tree window 
        if vim.bo.filetype == "neo-tree" then
          -- Already focused in the tree: close it
          vim.cmd("Neotree close")
        else
          -- In a file (tree open or closed): reveal + focus the tree
          vim.cmd("Neotree filesystem reveal left")
        end
      end, { desc = "Toggle/focus Neo-tree" })
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false
          },
        },
      })
    end,
  },
}
