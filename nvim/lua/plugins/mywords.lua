local map = require('util').map

map('n', '<c-m>', ":lua require'mywords'.hl_toggle()<CR>", { silent = true })
map('n', '<c-l>', ":lua require'mywords'.uhl_all()<CR>", { silent = true })
