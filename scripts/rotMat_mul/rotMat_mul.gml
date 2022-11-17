// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rotMat_mul(X,Y,Z,theta){
	var sinTh=sin(theta);
	var cosTh=cos(theta);
	var a=array_create(3);
	a[0]=cosTh*X+sinTh*Y;
	a[1]=sinTh*X+cosTh*Y;
	a[2]=Z;
}