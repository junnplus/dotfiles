require"lspinstall".setup()
require"lspinstall".post_install_hook = function()
    vim.cmd('bufdo e')
end
