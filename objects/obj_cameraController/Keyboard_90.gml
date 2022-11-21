/// @description Insert description here
// You can write your code in this editor


nbRay=0;
camX+=lookX*translationSpd*delta_time/1000000;
camY+=lookY*translationSpd*delta_time/1000000;
camZ+=lookZ*translationSpd*delta_time/1000000;

ViewMat=matrix_build_lookat(camX,camY,camZ,camX+lookX,camY+lookY,camZ+lookZ,upX,upY,upZ);