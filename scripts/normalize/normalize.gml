// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalize(vec){
	var size=array_length(vec);
	var a=array_create(size);
	var l=length_vec(vec);
	a[0]=vec[0]/l;
	a[1]=vec[1]/l;
	a[2]=vec[2]/l;
	return a;
}