/// @description Insert description here
// You can write your code in this editor


T=T+1.1243;

shader_set(shd_pathTracing);

shader_set_uniform_matrix_array(viewUniform,invert(ViewMat));
shader_set_uniform_matrix_array(projUniform,invert(ProjMat));
tex=surface_get_texture(surface);
texture_set_stage(surfaceUniform,tex);
shader_set_uniform_f_array(resUniform,[1280,720]);
shader_set_uniform_f_array(objPosUniform,array_concat(objs[?"pos"]));
//shader_set_uniform_f_array(objRotUniform,array_concat(objs[?"rot"]));
shader_set_uniform_f_array(objScaleUniform,array_concat(objs[?"scale"]));
shader_set_uniform_f_array(objPlaneNormalUniform,array_concat(objs[?"planeNormal"]));
shader_set_uniform_f_array(objDiffuseColorUniform,array_concat(objs[?"diffuse"]));
shader_set_uniform_f_array(objSpecColorUniform,array_concat(objs[?"spec"]));
shader_set_uniform_f_array(objSpecPowerUniform,objs[?"specPower"]);
shader_set_uniform_i_array(objIsEmittingUniform,objs[?"isEmitting"]);
shader_set_uniform_f_array(objEmitColorUniform,array_concat(objs[?"emitColor"]));
shader_set_uniform_i_array(objFractalIterUniform,objs[?"fractalIter"]);
shader_set_uniform_i_array(objTypeUniform,objs[?"type"]);
shader_set_uniform_i(objNumberUniform,objs[?"number"]);
shader_set_uniform_i(nbRayUniform,nbRay);
shader_set_uniform_f(timeUniform,T);

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

