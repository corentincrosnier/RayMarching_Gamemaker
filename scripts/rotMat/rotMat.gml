// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rotMat(axis,angle)
{
	var s = sin(angle);
	var c = cos(angle);
	var oc = 1.0 - c;
	axis = normalize(axis);
	var mat=[oc * axis[0] * axis[0] + c, oc * axis[0] * axis[1] - axis[2] * s, oc * axis[2] * axis[0] + axis[1] * s, 0,
							oc * axis[0] * axis[1] + axis[2] * s, oc * axis[1] * axis[1] + c, oc * axis[1] * axis[2] - axis[0] * s,0,
							oc * axis[2] * axis[0] - axis[1] * s, oc * axis[1] * axis[2] + axis[0] * s, oc * axis[2] * axis[2] + c,0,
							0,0,0,1];

	return mat;
}