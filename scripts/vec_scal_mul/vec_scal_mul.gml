// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vec_scal_mul(vec,scalar){
	for(var i=0;i<array_length(vec);i++){
		vec[i]=vec[i]*scalar;
	}
	return vec;
}