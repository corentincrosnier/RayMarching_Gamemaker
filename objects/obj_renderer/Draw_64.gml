/// @description Insert description here
// You can write your code in this editor


T=T+1.1243;

shader_set(shaderIndex);

set_uniforms(uniforms,shaderIndex);



show_debug_message(nbRay);

nbRay++;

surface_set_target(appSurface);
draw_surface(appSurface,0,0);
shader_reset();
surface_reset_target();
surface_set_target(surface);
draw_surface(appSurface,0,0);
surface_reset_target();
draw_surface(appSurface,0,0);


/*
surface_set_target(surface);
draw_surface(appSurface,0,0);
shader_reset();
//surface_set_target(surface);
//draw_surface(appSurface,0,0);
surface_reset_target();
draw_surface(appSurface,0,0);*/

