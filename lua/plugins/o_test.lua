return {
    {
        "nvim-mini/mini.test",
        enabled = function()
            local is_set = os.getenv("NVIM_TEST")
            return is_set ~= nil
        end,
        config = function()
            require("mini.test").setup()
        end
    }
}
