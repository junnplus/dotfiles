local map = require('util').map
local dap = require('dap')
require('dap-python').setup('python')

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Python: flask run',
        module = 'flask',
        args = {"run"},
    }
}

dap.adapters.go = function(callback, _)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end

dap.configurations.go = {
    {
        type = 'go',
        name = 'Go: main',
        request = 'launch',
        program = 'main.go',
    }
}

map('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<cr>")
map('n', '<leader>c', ":lua require'dap'.continue()<cr>")
map('n', '<leader>i', ":lua require'dap'.step_into()<cr>")
map('n', '<leader>n', ":lua require'dap'.step_over()<cr>")
