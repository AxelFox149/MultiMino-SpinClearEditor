function VarReset() {
	level   = 1
	score   = 0
	lines   = 0
	GOType  = -1
	Warning = false
	PixelFade = -1

	global.pause    = false
	global.gameover = false

	if(GMode <= 3) GMode = 0
	else GMode -= 3

	with(Control) ds_stack_destroy(Stack)



}
