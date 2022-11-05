G.matchup_matchparen_deferred = 1
G.matchup_matchparen_deferred_show_delay = 100
G.matchup_matchparen_hi_surround_always = 1
G.matchup_override_vimtex = 1
G.matchup_delim_start_plaintext = 0
G.matchup_transmute_enabled = 0

require("nvim-treesitter.configs").setup({
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
  },
})
