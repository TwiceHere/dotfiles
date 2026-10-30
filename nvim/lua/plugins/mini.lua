return {
    "nvim-mini/mini.nvim",
    lazy = true,
    opts = {
        ai = {
            n_lines = 500,
        },
        pairs = {},
        surround = {},
    },
    config = function(_, opts)
        for module, settings in pairs(opts) do
            require("mini." .. module).setup(settings)
        end
    end,
}
