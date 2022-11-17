/// @description Insert description here
// You can write your code in this editor

mouseX=window_mouse_get_x();
mouseY=window_mouse_get_y();


if(mouseX!=mouseXPrev && mouseY!=mouseYPrev && mouse_check_button(mb_right) && !mouse_check_button_pressed(mb_right)){
	
//	rotAxis = normalize(vec_add(vec_scal_mul([rightX,rightY,rightZ],mouseY - mouseYPrev),vec_scal_mul([upX,upY,upZ] ,mouseX - mouseXPrev)));
	rotAxis = vec_add(vec_scal_mul([rightX,rightY,rightZ],mouseY - mouseYPrev),vec_scal_mul([upX,upY,upZ] ,mouseX - mouseXPrev));

	var mat=rotMat(normalize(rotAxis),length_vec(rotAxis)*mouseSpd*delta_time/1000000);

	var newL=mat_vec_mul(mat,4,4,[lookX,lookY,lookZ,0]);
	newL=normalize(newL);
	lookX=newL[0];
	lookY=newL[1];
	lookZ=newL[2];

	var newL=mat_vec_mul(mat,4,4,[upX,upY,upZ,0]);
	newL=normalize(newL);
	upX=newL[0];
	upY=newL[1];
	upZ=newL[2];

	var a=cross_prod(lookX,lookY,lookZ,upX,upY,upZ);
	rightX=-a[0];
	rightY=-a[1];
	rightZ=-a[2];

	ViewMat=matrix_build_lookat(camX,camY,camZ,camX+lookX,camY+lookY,camZ+lookZ,upX,upY,upZ);

	mouseXPrev=mouseX;
	mouseYPrev=mouseY;
	//window_mouse_set(window_get_width()/2, window_get_height()/2);
}
else if(mouse_check_button_pressed(mb_right)){
	window_mouse_set(window_get_width()/2, window_get_height()/2);
	mouseX=window_get_width()/2;
	mouseY=window_get_height()/2;
	mouseXPrev=mouseX;
	mouseYPrev=mouseY;
}