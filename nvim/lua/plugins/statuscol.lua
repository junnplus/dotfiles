return {
    "luukvbaal/statuscol.nvim",
    opts = function()
        local builtin = require("statuscol.builtin")
        return {
            relculright = true,
            segments = {
                {
                    sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                {
                    text = { " " },
                    condition = { builtin.not_empty, true, builtin.not_empty },
                    click = "v:lua.ScFa"
                },
                {
                    sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
                    click = "v:lua.ScSa"
                },
            }
        }
    end
}
