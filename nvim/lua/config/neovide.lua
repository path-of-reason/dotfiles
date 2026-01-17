local v = vim
if v.g.neovide then
	-- scale
	v.g.neovide_scale_factor = 1
	-- padding
	v.g.neovide_padding_top = 8
	v.g.neovide_padding_left = 8
	v.g.neovide_padding_right = 0
	v.g.neovide_padding_bottom = 0
	-- blur
	v.g.neovide_window_blurred = true
	v.g.neovide_floating_blur_amount_x = 4.0
	v.g.neovide_floating_blur_amount_y = 4.0
	-- shadow
	v.g.neovide_floating_shadow = true
	v.g.neovide_floating_z_height = 10
	v.g.neovide_light_angle_degrees = 45
	v.g.neovide_light_radius = 5
	-- transparency
	-- v.g.neovide_transparency = 0.7 (Deprecated)
	v.g.neovide_opacity = 0.7
end
