// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vec_add(vec1,vec2){
	var l=array_length(vec1);
	if(l==array_length(vec2)){
		var vec3=array_create(l);
		for(var i=0;i<l;i++){
			vec3[i]=vec1[i]+vec2[i];
		}
		return vec3;
	}
	else return [0,0,0];
}