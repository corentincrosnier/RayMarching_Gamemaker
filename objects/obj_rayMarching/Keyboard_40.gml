/// @description Insert description here
// You can write your code in this editor

var mat=rotMat([1,0,0],-rotationSpd*delta_time/1000000);

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

