/// @description Insert description here
// You can write your code in this editor

shader_set(shd_sphere);
shader_set_uniform_matrix_array(viewUniform,invert(ViewMat));
shader_set_uniform_matrix_array(projUniform,invert(ProjMat));
draw_surface(application_surface,0,0);
shader_reset();

