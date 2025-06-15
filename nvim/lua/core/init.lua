require("core.opts")
require("core.maps")

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

-- Auto commands
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.cmd.mark({ args = { 'a' }})
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 50,
        })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        vim.api.nvim_exec("silent! normal! g`\"zv", false)
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

