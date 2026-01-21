vim.g.matchup_enabled = 1

vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_motion_enabled = 0
vim.g.matchup_text_obj_enabled = 0

vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_hi_surround_always = 1
vim.g.matchup_matchparen_offscreen = { method = "popup" }

vim.api.nvim_set_hl(0, "MatchParen", { 
  underline = true,
  italic = true,
  bold = true,
})

vim.api.nvim_set_hl(0, "MatchWord", {
  underline = true,
  italic = true,
  bold = true,
})
