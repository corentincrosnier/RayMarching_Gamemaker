// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_uniforms(uniformMap, shd_index){
	uniformMap[?"surfaceUniform"]=shader_get_sampler_index(shaderIndex,"surface");
	uniformMap[?"resUniform"]=shader_get_uniform(shaderIndex,"res");
	uniformMap[?"viewUniform"]=shader_get_uniform(shaderIndex,"view");
	uniformMap[?"projUniform"]=shader_get_uniform(shaderIndex,"proj");
	uniformMap[?"objPosUniform"]=shader_get_uniform(shaderIndex,"objPos");
	//objRotUniform=shader_get_uniform(shaderIndex,"objRot");
	uniformMap[?"objScaleUniform"]=shader_get_uniform(shaderIndex,"objScale");
	uniformMap[?"objDiffuseColorUniform"]=shader_get_uniform(shaderIndex,"objDiffuseColor");
	uniformMap[?"objSpecColorUniform"]=shader_get_uniform(shaderIndex,"objSpecColor");
	uniformMap[?"objSpecPowerUniform"]=shader_get_uniform(shaderIndex,"objSpecPower");
	uniformMap[?"objFractalIterUniform"]=shader_get_uniform(shaderIndex,"objFractalIter");
	uniformMap[?"objPlaneNormalUniform"]=shader_get_uniform(shaderIndex,"objPlaneNormal");
	uniformMap[?"objTypeUniform"]=shader_get_uniform(shaderIndex,"objType");
	uniformMap[?"objNumberUniform"]=shader_get_uniform(shaderIndex,"objNumber");
	uniformMap[?"objIsEmittingUniform"]=shader_get_uniform(shaderIndex,"objIsEmitting");
	uniformMap[?"objEmitColorUniform"]=shader_get_uniform(shaderIndex,"objEmitColor");
	if(shd_index==shd_pathTracing){
		uniformMap[?"timeUniform"]=shader_get_uniform(shaderIndex,"time");
		uniformMap[?"nbRayUniform"]=shader_get_uniform(shaderIndex,"nbRay");
	}
}