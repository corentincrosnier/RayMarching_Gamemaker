/// @description Insert description here
// You can write your code in this editor

shader_set(shd_raymarching);
shader_set_uniform_matrix_array(viewUniform,invert(ViewMat));
shader_set_uniform_matrix_array(projUniform,invert(ProjMat));

shader_set_uniform_f_array(objPosUniform,[1,0,0,
											-1,0,0]);
shader_set_uniform_f_array(objRotUniform,[0,0,0,
											0,0,0]);
shader_set_uniform_f_array(objScaleUniform,[0.5,1,1,
											1,0.45,1]);
shader_set_uniform_f_array(objDiffuseColorUniform,[0.8,0.8,0.8,
													1,0,0]);
shader_set_uniform_f_array(objSpecColorUniform,[1,1,1,
												1,1,1]);
shader_set_uniform_f_array(objSpecPowerUniform,[10,20]);
shader_set_uniform_i_array(objFractalIterUniform,[5,3]);
shader_set_uniform_i_array(objTypeUniform,[2,3]);
shader_set_uniform_i(objNumberUniform,2);

/*
shader_set_uniform_f_array(objPosUniform,array_concat(objs[?"pos"]));
shader_set_uniform_f_array(objRotUniform,array_concat(objs[?"rot"]));
shader_set_uniform_f_array(objScaleUniform,array_concat(objs[?"scale"]));
shader_set_uniform_f_array(objDiffuseColorUniform,array_concat(objs[?"diffuse"]));
shader_set_uniform_f_array(objSpecColorUniform,array_concat(objs[?"spec"]));
shader_set_uniform_f_array(objSpecPowerUniform,objs[?"specPower"]);
shader_set_uniform_i_array(objFractalIterUniform,objs[?"fractalIter"]);
shader_set_uniform_i_array(objTypeUniform,objs[?"type"]);
shader_set_uniform_i(objNumberUniform,objs[?"number"]);
*/


/*
shader_set_uniform_f_array(objUniform,[obj[?"pos"][0],obj[?"pos"][1],obj[?"pos"][2],obj[?"pos"][3],
									obj[?"diffuse"][0],obj[?"diffuse"][1],obj[?"diffuse"][2],
									obj[?"spec"][0],obj[?"spec"][1],obj[?"spec"][2],
									obj[?"specPower"]])
*/
//shader_set_uniform_f_array(objUniform,obj);
draw_surface(application_surface,0,0);
shader_reset();

