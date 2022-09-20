# V_sokol_gp
a V wrapper for the sokol_gp library 

# Sokol_gp
Sokol_gp is a 2d rendering library for Sokol that has many optimations to it like batch rendering plus it is super easy to use and setup 
# install
`v install mohamedLT.sokolgp`
# supported platforms 
basically, it runs where Sokol runs 
for android you can use vab 
# Example :
```
import gg
import sokol
import sokol.sapp
import mohamedlt.sokolgp 
import sokol.gfx
import math 


fn frame(s voidptr) {
    width := sapp.width() 
    height := sapp.height()
    ratio := width/f32(height)

    sokolgp.begin(width, height)
    sokolgp.viewport(0, 0, width, height)
    sokolgp.project(-ratio, ratio, 1.0, -1.0)

    sokolgp.set_color(0.1, 0.1, 0.1, 1.0)
    sokolgp.clear()

    time := f32(sapp.frame_count() * sapp.frame_duration())
    r := math.sinf(time)*0.5+0.5
    g := math.cosf(time)*0.5+0.5
    sokolgp.set_color(r, g, 0.3, 1.0)
    sokolgp.rotate_at(time, 0.0, 0.0)
    sokolgp.draw_filled_rect(-0.5, -0.5, 1.0, 1.0)

    pass_action := gfx.PassAction{}
    gfx.begin_default_pass(&pass_action, width, height)
    sokolgp.flush()
    sokolgp.end()
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

    sgpdesc := sokolgp.Desc{}
    sokolgp.setup(&sgpdesc)
    if !sokolgp.is_valid() {
        println("Failed to create Sokol GP context:  ${sokolgp.get_error_message(sokolgp.get_last_error())}\n")
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
