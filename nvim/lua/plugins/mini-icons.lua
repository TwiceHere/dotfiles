return {
    -- 1. Configure mini.icons to spoof/mock nvim-web-devicons
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            -- Intercept packages before they look for nvim-web-devicons
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    }
}
