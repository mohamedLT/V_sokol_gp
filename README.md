# V_sokol_gp
a V wrapper for the sokol_gp library 

# Sokol_gp
Sokol_gp is a 2d rendering library for Sokol that has many optimations to it like batch rendering plus it is super easy to use and setup 
#supported platforms 
basically, it runs where Sokol runs 
for android you can use vab 
#Example :
```
import gg
import sokol
import sokol.sapp
import sokol_gp 
import sokol.gfx
import math 


fn frame(s voidptr) {
    width := sapp.width() 
    height := sapp.height()
    ratio := width/f32(height)

    sokol_gp.begin(width, height)
    sokol_gp.viewport(0, 0, width, height)
    sokol_gp.project(-ratio, ratio, 1.0, -1.0)

    sokol_gp.set_color(0.1, 0.1, 0.1, 1.0)
    sokol_gp.clear()

    time := f32(sapp.frame_count() * sapp.frame_duration())
    r := math.sinf(time)*0.5+0.5
    g := math.cosf(time)*0.5+0.5
    sokol_gp.set_color(r, g, 0.3, 1.0)
    sokol_gp.rotate_at(time, 0.0, 0.0)
    sokol_gp.draw_filled_rect(-0.5, -0.5, 1.0, 1.0)

    pass_action := gfx.PassAction{}
    gfx.begin_default_pass(&pass_action, width, height)
    sokol_gp.flush()
    sokol_gp.end()
    gfx.end_pass()
    gfx.commit()
}

fn init(s voidptr) {
    sgdesc := sapp.create_desc() 
    gfx.setup(&sgdesc)
    if !gfx.is_valid() {
        println("Failed to create Sokol GFX context!\n")
        exit(-1)
    }

    sgpdesc := sokol_gp.Desc{}
    sokol_gp.setup(&sgpdesc)
    if !sokol_gp.is_valid() {
        println("Failed to create Sokol GP context:  ${sokol_gp.get_error_message(sokol_gp.get_last_error())}\n")
        exit(-1)
    }
}



struct App {
mut:
	gg          &gg.Context = unsafe { nil }
}

[console]
fn main() {
	mut app := &App{
		gg: 0
	}

	app.gg = gg.new_context(
		width: 600
		height: 600
		user_data: app
		create_window: true
		window_title: '3D Cube Demo'
		frame_fn: frame
		init_fn: init
	)

	app.gg.run()
}
```
