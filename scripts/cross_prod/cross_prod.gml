// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cross_prod(x1,y1,z1,x2,y2,z2){
	var a=array_create(3);
	a[0]=y1*z2-z1*y2;
	a[1]=z1*x2-x1*z2;
	a[2]=x1*y2-x2*y1;
	return a;
}