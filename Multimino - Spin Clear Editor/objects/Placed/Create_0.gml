CColor = Control.board[(y + 1152) / 64, (x - BoardStart) / 64]

image_speed  = 0
image_xscale = 2
image_yscale = 2
image_index = Options[1]
image_blend = ColorPal[CColor]

if(Control.stage != 2) Flash = true
else Flash = false
alpha = 0.6

Vanish = false

