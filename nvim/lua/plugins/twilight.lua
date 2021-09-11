require("twilight").setup {
    dimming = {
        inactive = true,
    },
    context = 20,
    expand = {
        "class",
        "function",
        "method",
        "table",
        "if_statement",
    },
}
