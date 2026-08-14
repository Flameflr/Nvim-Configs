return
{
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    module = "telescope",

  config = function()

    require('telescope').setup({})

    local builtin = require('telescope.builtin')


    vim.keymap.set("n", "<leader>en", function()
     builtin.find_files { cwd = vim.fn.stdpath "config" }
    end)

    vim.keymap.set("n", "<leader>hy", function() builtin.find_files { cwd = "~/.config/hypr" }
    end)

  end,

}








