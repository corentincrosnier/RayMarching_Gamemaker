/// @description Insert description here
// You can write your code in this editor


nbRay=0;
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

viewUniform=shader_get_uniform(shd_raymarching,"view");
projUniform=shader_get_uniform(shd_raymarching,"proj");

