/// @description Insert description here
// You can write your code in this editor

objPosUniform=shader_get_uniform(shd_raymarching,"objPos");
objRotUniform=shader_get_uniform(shd_raymarching,"objRot");
objScaleUniform=shader_get_uniform(shd_raymarching,"objScale");
objDiffuseColorUniform=shader_get_uniform(shd_raymarching,"objDiffuse");
objSpecColorUniform=shader_get_uniform(shd_raymarching,"objSpecColor");
objSpecPowerUniform=shader_get_uniform(shd_raymarching,"objSpecPower");
objFractalIterUniform=shader_get_uniform(shd_raymarching,"objFractalIter");
objTypeUniform=shader_get_uniform(shd_raymarching,"objType");
objNumberUniform=shader_get_uniform(shd_raymarching,"objNumber");


objs=ds_map_create();
ds_map_add(objs,"pos",array_create(0));
ds_map_add(objs,"rot",array_create(0));
ds_map_add(objs,"scale",array_create(0));
ds_map_add(objs,"diffuse",array_create(0));
ds_map_add(objs,"spec",array_create(0));
ds_map_add(objs,"specPower",array_create(0));
ds_map_add(objs,"fractalIter",array_create(0));
ds_map_add(objs,"type",array_create(0));
ds_map_add(objs,"number",0);

array_push(objs[?"pos"],[1,0,0]);
array_push(objs[?"rot"],[0,0,0]);
array_push(objs[?"scale"],[1,1,1]);
array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
array_push(objs[?"spec"],[1,1,1]);
array_push(objs[?"specPower"],10);
array_push(objs[?"fractalIter"],1);
array_push(objs[?"type"],1);
objs[?"number"]+=1;



zoom_speed=100;
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

viewUniform=shader_get_uniform(shd_raymarching,"view");
projUniform=shader_get_uniform(shd_raymarching,"proj");

ViewMat=matrix_build_lookat(camX,camY,camZ,camX+lookX,camY+lookY,camZ+lookZ,upX,upY,upZ);
ProjMat=matrix_build_projection_perspective_fov(fov_y,aspect,znear,zfar);
