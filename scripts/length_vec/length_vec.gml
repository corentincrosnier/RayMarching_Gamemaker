// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function length_vec(vec){
	var l=array_length(vec);
	var a=0;
	for(var i=0;i<l;i++){
		a+=vec[i]*vec[i];
	}
	return sqrt(a);
}