/// @description Valores iniciales

image_speed  = 0
sprite_index = 0
image_xscale = 4
image_yscale = 4

Down = false
Drop = false

Spin = 0
Move = 0
Dir  = 0
Tic  = 20
CM   = false
DAS  = false
ST   = false
MoveTimer = 0

LT = 0
ML = 15
BC = 115
PlaceTimer = 30
ResetTime  = 30


HardDrop = part_system_create()
DropEmm  = part_emitter_create(HardDrop)
p_Spark  = part_type_create()
part_type_sprite(p_Spark,SmolSpark,true,true,false)
part_type_scale(p_Spark,1.5,1.5)
part_type_speed(p_Spark,1,4.25,0,0)
part_type_direction(p_Spark,90,90,0,0)
part_type_life(p_Spark,30,45)
part_type_size(p_Spark,0.7,1.2,0,0)

