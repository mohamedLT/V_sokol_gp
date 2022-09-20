module sokolgp
import sokol
import sokol.gfx

#include "@VMODROOT/sokol_gp.h"

enum SGP_ERROR  {
    sgp_no_error = 0
    sgp_error_sokol_invalid
    sgp_error_vertices_full
    sgp_error_uniforms_full
    sgp_error_commands_full
    sgp_error_vertices_overflow
    sgp_error_transform_stack_overflow
    sgp_error_transform_stack_underflow
    sgp_error_state_stack_overflow
    sgp_error_state_stack_underflow
    sgp_error_alloc_failed
    sgp_error_make_vertex_buffer_failed
    sgp_error_make_white_image_failed
    sgp_error_make_common_shader_failed
    sgp_error_make_common_pipeline_failed
} 

enum BlendMode  {
    sgp_blendmode_none = 0 /* No blending.
                               dstRGBA = srcRGBA */
    sgp_blendmode_blend    /* Alpha blending.
                               dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA))
                               dstA = srcA + (dstA * (1-srcA)) */
    sgp_blendmode_add      /* Color add.
                               dstRGB = (srcRGB * srcA) + dstRGB
                               dstA = dstA */
    sgp_blendmode_mod      /* Color modulate.
                               dstRGB = srcRGB * dstRGB
                               dstA = dstA */
    sgp_blendmode_mul      /* Color multiply.
                               dstRGB = (srcRGB * dstRGB) + (dstRGB * (1-srcA))
                               dstA = (srcA * dstA) + (dstA * (1-srcA)) */
    sgp_blendmode_num
} 


struct C.sgp_isize {
pub mut :
	w int
	h int
} 
type ISize = C.sgp_isize

struct C.sgp_irect {
pub mut :
	x int
	y int
	w int
	h int
} 
type IRect = C.sgp_irect

struct C.sgp_rect {
pub mut :
	x f32
	y f32
	w f32
	h f32
} 
type Rect = C.sgp_rect

struct C.sgp_textured_rect {
    dst Rect
    src Rect
} 
type TexturedRect = C.sgp_textured_rect

struct C.sgp_vec2 {
	x f32
	y f32
} 
type Vec2 = C.sgp_vec2

 type Point= C.sgp_vec2

 struct C.sgp_line {
	a Point
	b Point
} 
type Line = C.sgp_line

 struct C.sgp_triangle {
	a Point
	b Point
	c Point
} 
type Triangle = C.sgp_triangle

 struct C.sgp_mat2x3 {
    v [2][3]f32
} 
type Mat2x3 = C.sgp_mat2x3

 struct C.sgp_color {
	r f32 
	g f32
	b f32
	a f32
} 
type Color = C.sgp_color

 struct C.sgp_uniform {
	size u32
	content [4]f32
} 
type Uniform = C.sgp_uniform

 struct C.sgp_images_uniform {
    count u32
    images [4]gfx.Image
} 
type ImagesUniform = C.sgp_images_uniform

 struct C.sgp_state {
    frame_size ISize
    viewport IRect
    scissor IRect
    proj Mat2x3
    transform Mat2x3
    mvp Mat2x3
    color Color
    images ImagesUniform
    uniform Uniform
    blend_mode BlendMode
    pipeline gfx.Pipeline
    _base_vertex u32
    _base_uniform u32
    _base_command u32
} 
type State = C.sgp_state

struct C.sgp_desc {
    max_vertices  u32 
    max_commands u32 
}
pub type Desc = C.sgp_desc

struct C.sgp_pipeline_desc {
    shader gfx.ShaderDesc 
    primitive_type gfx.PrimitiveType 
    blend_mode BlendMode
} 

pub type PipeLineDesc = C.sgp_pipeline_desc

fn C.sgp_setup(desc &Desc)
[inline]
pub fn setup(desc &Desc){
 C.sgp_setup(desc)
}
fn C.sgp_shutdown()
[inline]
pub fn shutdown(){
 C.sgp_shutdown()
}
fn C.sgp_is_valid() bool
[inline]
pub fn is_valid()bool{
 return C.sgp_is_valid()
}

fn C.sgp_get_last_error() SGP_ERROR
[inline]
pub fn get_last_error()SGP_ERROR{
	return C.sgp_get_last_error()
}
fn C.sgp_get_error_message(SGP_ERROR) &char
[inline]
pub fn get_error_message(err SGP_ERROR)&char{
	return C.sgp_get_error_message(err)
}

fn C.sgp_make_pipeline( desc &PipeLineDesc) gfx.Pipeline 
pub fn make_pipeline( desc &PipeLineDesc) gfx.Pipeline {
return C.sgp_make_pipeline( desc )
}

fn C.sgp_begin(width int, height int)
pub fn begin(width int, height int){
	C.sgp_begin(width,height)
}
fn C.sgp_flush()
pub fn flush(){
	C.sgp_flush()
}
fn C.sgp_end()
pub fn end(){
	C.sgp_end()
}

fn C.sgp_project(left f32, right f32, top f32, bottom f32)
pub fn project(left f32, right f32, top f32, bottom f32){
	C.sgp_project(left,right,top,bottom)
}
fn C.sgp_reset_project()
pub fn reset_project(){
	C.sgp_reset_project()
}

fn C.sgp_push_transform()
pub fn push_transform(){
 C.sgp_push_transform()
}
fn C.sgp_pop_transform()
pub fn pop_transform(){
 C.sgp_pop_transform()
}
fn C.sgp_reset_transform()
pub fn reset_transform(){
 C.sgp_reset_transform()
}
fn C.sgp_translate(x f32, y f32)
pub fn translate(x f32, y f32){
 C.sgp_translate(x , y )
}
fn C.sgp_rotate(theta f32)
pub fn rotate(theta f32){
 C.sgp_rotate(theta )
}
fn C.sgp_rotate_at(theta f32, x f32, y f32)
pub fn rotate_at(theta f32, x f32, y f32){
 C.sgp_rotate_at(theta , x , y )
}
fn C.sgp_scale(sx f32, sy f32)
pub fn scale(sx f32, sy f32){
 C.sgp_scale(sx , sy )
}
fn C.sgp_scale_at(sx f32, sy f32, x f32, y f32)
pub fn scale_at(sx f32, sy f32, x f32, y f32){
 C.sgp_scale_at(sx , sy , x , y )
}

fn C.sgp_set_pipeline(pipeline gfx.Pipeline)
pub fn set_pipeline(pipeline gfx.Pipeline){
 C.sgp_set_pipeline(pipeline )
}
fn C.sgp_reset_pipeline()
pub fn reset_pipeline(){
 C.sgp_reset_pipeline()
}
fn C.sgp_set_uniform(data voidptr, size u32)
pub fn set_uniform(data voidptr, size u32){
 C.sgp_set_uniform(data , size )
}
fn C.sgp_reset_uniform()
pub fn reset_uniform(){
 C.sgp_reset_uniform()
}

fn C.sgp_set_blend_mode(blend_mode BlendMode)
pub fn set_blend_mode(blend_mode BlendMode){
 C.sgp_set_blend_mode(blend_mode )
}
fn C.sgp_reset_blend_mode()
pub fn reset_blend_mode(){
 C.sgp_reset_blend_mode()
}
fn C.sgp_set_color(r f32, g f32, b f32, a f32)
pub fn set_color(r f32, g f32, b f32, a f32){
 C.sgp_set_color(r , g , b , a )
}
fn C.sgp_reset_color()
pub fn reset_color(){
 C.sgp_reset_color()
}
fn C.sgp_set_image(channel int, image gfx.Image)
pub fn set_image(channel int, image gfx.Image){
 C.sgp_set_image(channel , image )
}
fn C.sgp_unset_image(channel int)
pub fn unset_image(channel int){
 C.sgp_unset_image(channel )
}
fn C.sgp_reset_image(channel int)
pub fn reset_image(channel int){
 C.sgp_reset_image(channel )
}

fn C.sgp_viewport(x int , y int , w int , h int )
pub fn viewport(x int , y int , w int , h int ){
 C.sgp_viewport(x , y , w , h )
}
fn C.sgp_reset_viewport()
pub fn reset_viewport(){
 C.sgp_reset_viewport()
}
fn C.sgp_scissor(x int, y int, w int, h int)
pub fn scissor(x int, y int, w int, h int){
 C.sgp_scissor(x , y , w , h )
}
fn C.sgp_reset_scissor()
pub fn reset_scissor(){
 C.sgp_reset_scissor()
}
fn C.sgp_reset_state()
pub fn reset_state(){
 C.sgp_reset_state()
}

fn C.sgp_clear()
pub fn clear(){
 C.sgp_clear()
}
fn C.sgp_draw_points( points &Point, count u32)
pub fn draw_points( points &Point, count u32){
 C.sgp_draw_points( points , count )
}
fn C.sgp_draw_point(x f32, y f32)
pub fn draw_point(x f32, y f32){
 C.sgp_draw_point(x , y )
}
fn C.sgp_draw_lines(lines &Line, count u32)
pub fn draw_lines(lines &Line, count u32){
 C.sgp_draw_lines(lines , count )
}
fn C.sgp_draw_line(ax f32, ay f32, bx f32, by f32)
pub fn draw_line(ax f32, ay f32, bx f32, by f32){
 C.sgp_draw_line(ax , ay , bx , by )
}
fn C.sgp_draw_lines_strip(points &Point, count u32)
pub fn draw_lines_strip(points &Point, count u32){
 C.sgp_draw_lines_strip(points , count )
}
fn C.sgp_draw_filled_triangles(triangles &Triangle, count u32)
pub fn draw_filled_triangles(triangles &Triangle, count u32){
 C.sgp_draw_filled_triangles(triangles , count )
}
fn C.sgp_draw_filled_triangle(ax f32, ay f32, bx f32, by f32, cx f32, cy f32)
pub fn draw_filled_triangle(ax f32, ay f32, bx f32, by f32, cx f32, cy f32){
 C.sgp_draw_filled_triangle(ax , ay , bx , by , cx , cy )
}
fn C.sgp_draw_filled_triangles_strip( points &Point, count u32)
pub fn draw_filled_triangles_strip( points &Point, count u32){
 C.sgp_draw_filled_triangles_strip( points , count )
}
fn C.sgp_draw_filled_rects(rects &Rect, count u32)
pub fn draw_filled_rects(rects &Rect, count u32){
 C.sgp_draw_filled_rects(rects , count )
}
fn C.sgp_draw_filled_rect(x f32, y f32, w f32, h f32)
pub fn draw_filled_rect(x f32, y f32, w f32, h f32){
 C.sgp_draw_filled_rect(x , y , w , h )
}
fn C.sgp_draw_textured_rects(rects &Rect, count u32)
pub fn draw_textured_rects(rects &Rect, count u32){
 C.sgp_draw_textured_rects(rects , count )
}
fn C.sgp_draw_textured_rect(x f32, y f32, w f32, h f32)
pub fn draw_textured_rect(x f32, y f32, w f32, h f32){
 C.sgp_draw_textured_rect(x , y , w , h )
}
fn C.sgp_draw_textured_rects_ex(channel int, rects &TexturedRect, count u32)
pub fn draw_textured_rects_ex(channel int, rects &TexturedRect, count u32){
 C.sgp_draw_textured_rects_ex(channel , rects , count )
}
fn C.sgp_draw_textured_rect_ex(channel int, dest_rect Rect, src_rect Rect)
pub fn draw_textured_rect_ex(channel int, dest_rect Rect, src_rect Rect){
 C.sgp_draw_textured_rect_ex(channel , dest_rect , src_rect )
}

fn C.sgp_query_state() &State
pub fn query_state() &State{
 return C.sgp_query_state() 
}
fn C.sgp_query_desc() Desc
pub fn query_desc() Desc{
 return C.sgp_query_desc() 
}



