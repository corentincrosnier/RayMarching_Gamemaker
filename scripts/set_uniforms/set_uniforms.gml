// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_uniforms(uniforms,shd_index){
	shader_set_uniform_matrix_array(uniforms[?"viewUniform"],invert(global.ViewMat));
	shader_set_uniform_matrix_array(uniforms[?"projUniform"],invert(global.ProjMat));
	texture_set_stage(uniforms[?"surfaceUniform"],surface_get_texture(surface));
	shader_set_uniform_f_array(uniforms[?"resUniform"],[room_width,room_height]);
	shader_set_uniform_f_array(uniforms[?"objPosUniform"],array_concat(global.scene[?"pos"]));
	//shader_set_uniform_f_array(objRotUniform,array_concat(objs[?"rot"]));
	shader_set_uniform_f_array(uniforms[?"objScaleUniform"],array_concat(objs[?"scale"]));
	shader_set_uniform_f_array(uniforms[?"objPlaneNormalUniform"],array_concat(objs[?"planeNormal"]));
	shader_set_uniform_f_array(uniforms[?"objDiffuseColorUniform"],array_concat(objs[?"diffuse"]));
	shader_set_uniform_f_array(uniforms[?"objSpecColorUniform"],array_concat(objs[?"spec"]));
	shader_set_uniform_f_array(uniforms[?"objSpecPowerUniform"],objs[?"specPower"]);
	shader_set_uniform_i_array(uniforms[?"objIsEmittingUniform"],objs[?"isEmitting"]);
	shader_set_uniform_f_array(uniforms[?"objEmitColorUniform"],array_concat(objs[?"emitColor"]));
	shader_set_uniform_i_array(uniforms[?"objFractalIterUniform"],objs[?"fractalIter"]);
	shader_set_uniform_i_array(uniforms[?"objTypeUniform"],objs[?"type"]);
	shader_set_uniform_i(uniforms[?"objNumberUniform"],objs[?"number"]);
	shader_set_uniform_i(uniforms[?"nbRayUniform"],nbRay);
	shader_set_uniform_f(uniforms[?"timeUniform"],T);
}