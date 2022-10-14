require("smoothcursor").setup({
    fancy = {
        enable = true, -- enable fancy mode
        head = { cursor = "", texthl = "SmoothCursorYellow", linehl = nil },
        body = {
            { cursor = "♪", texthl = "SmoothCursorRed" },
            { cursor = "♪", texthl = "SmoothCursorOrange" },
            { cursor = "♪", texthl = "SmoothCursorYellow" },
            { cursor = "♫", texthl = "SmoothCursorGreen" },
            { cursor = "♫", texthl = "SmoothCursorAqua" },
            { cursor = "♬", texthl = "SmoothCursorBlue" },
            { cursor = "♬", texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
    },
    speed = 20,
})
