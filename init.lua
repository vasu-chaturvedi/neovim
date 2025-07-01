require("keymaps")
require("options")


vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "TabNew", "TabClosed", "TabEnter", "VimEnter" }, {
  callback = function()
    local count = #vim.api.nvim_list_tabpages()
    -- Show tabline only if more than one tab page is open
    vim.opt.showtabline = (count > 1) and 2 or 0
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        print("[LSP] bashls attached at: " .. os.date("%X"))
    end
})


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    if vim.fn.executable('git') == 1 then
        local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
        local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
        if vim.v.shell_error ~= 0 then
            error('Error cloning lazy.nvim:\n' .. out)
        end
    else
        error('lazy.nvim not found and git is not available! Please copy it manually to: ' .. lazypath)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

