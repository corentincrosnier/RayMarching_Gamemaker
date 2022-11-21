/// @description Insert description here
// You can write your code in this editor


shaderIndex=shd_directIlluminate;

appSurface=surface_create(room_width,room_height);
surface=surface_create(room_width,room_height);
application_surface_draw_enable(false);
//application_surface_enable(false);

uniforms=ds_map_create();


load_uniforms(uniforms,shaderIndex);

global.nbRay=0;

T=0.1;



nbRay=0;


