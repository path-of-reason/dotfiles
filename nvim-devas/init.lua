if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

if vim.g.neovide then
  print('hello neovide')
  -- scale
  vim.g.neovide_scale_factor = 1.2
  -- blur
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  -- transparent
  vim.g.neovide_transparency = 0.8
  -- border
  vim.g.neovide_show_border = true
end
