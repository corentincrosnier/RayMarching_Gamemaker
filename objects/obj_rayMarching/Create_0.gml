/// @description Insert description here
// You can write your code in this editor

translationSpd=3;
rotationSpd=1;
mouseSpd=0.1;
mouseXPrev=window_get_width()/2;
mouseYPrev=window_get_height()/2;

camX=0;
camY=0;
camZ=-10;
lookX=0;
lookY=0;
lookZ=1;
rightX=1;
rightY=0;
rightZ=0;
upX=0;
upY=1;
upZ=0;
rotAxis=0;

fov_y=45;
aspect=16/9;
znear=0.1;
zfar=200;

viewUniform=shader_get_uniform(shd_sphere,"view");
projUniform=shader_get_uniform(shd_sphere,"proj");

ViewMat=matrix_build_lookat(camX,camY,camZ,camX+lookX,camY+lookY,camZ+lookZ,upX,upY,upZ);
ProjMat=matrix_build_projection_perspective_fov(fov_y,aspect,znear,zfar);
