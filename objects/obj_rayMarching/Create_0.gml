/// @description Insert description here
// You can write your code in this editor

appSurface=surface_create(room_width,room_height);
surface=surface_create(room_width,room_height);
application_surface_draw_enable(false);
//application_surface_enable(false);

enum SHAPES{
	BOX,
	SPHERE,
	MENGER,
	MANDELBULB,
	PLANE,
	ROUND_BOX
};

T=0.1;

surfaceUniform=shader_get_sampler_index(shd_pathTracing,"surface");

objPosUniform=shader_get_uniform(shd_pathTracing,"objPos");
//objRotUniform=shader_get_uniform(shd_pathTracing,"objRot");
objScaleUniform=shader_get_uniform(shd_pathTracing,"objScale");
//objDiffuseColorUniform=shader_get_uniform(shd_pathTracing,"objDiffuse");
objSpecColorUniform=shader_get_uniform(shd_pathTracing,"objSpecColor");
objSpecPowerUniform=shader_get_uniform(shd_pathTracing,"objSpecPower");
objFractalIterUniform=shader_get_uniform(shd_pathTracing,"objFractalIter");
objPlaneNormalUniform=shader_get_uniform(shd_pathTracing,"objPlaneNormal");
objTypeUniform=shader_get_uniform(shd_pathTracing,"objType");
objNumberUniform=shader_get_uniform(shd_pathTracing,"objNumber");
viewUniform=shader_get_uniform(shd_pathTracing,"view");
projUniform=shader_get_uniform(shd_pathTracing,"proj");

nbRayUniform=shader_get_uniform(shd_pathTracing,"nbRay");
timeUniform=shader_get_uniform(shd_pathTracing,"time");
//objIsEmittingUniform=shader_get_uniform(shd_pathTracing,"objIsEmitting");
//objEmitColorUniform=shader_get_uniform(shd_pathTracing,"objEmitColor");

nbRay=0;

objs=ds_map_create();
ds_map_add(objs,"pos",array_create(0));
ds_map_add(objs,"rot",array_create(0));
ds_map_add(objs,"scale",array_create(0));
ds_map_add(objs,"diffuse",array_create(0));
ds_map_add(objs,"spec",array_create(0));
ds_map_add(objs,"specPower",array_create(0));
ds_map_add(objs,"fractalIter",array_create(0));
ds_map_add(objs,"planeNormal",array_create(0));
ds_map_add(objs,"isEmitting",array_create(0));
ds_map_add(objs,"emitColor",array_create(0));
ds_map_add(objs,"type",array_create(0));
ds_map_add(objs,"number",0);


init_scene();

show_debug_message(objs[?"pos"]);
show_debug_message(array_concat(objs[?"pos"]));



zoom_speed=100;
translationSpd=3;
rotationSpd=1;
mouseSpd=0.1;
mouseXPrev=window_get_width()/2;
mouseYPrev=window_get_height()/2;

camX=0;
camY=0;
camZ=-9;
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


ViewMat=matrix_build_lookat(camX,camY,camZ,camX+lookX,camY+lookY,camZ+lookZ,upX,upY,upZ);
ProjMat=matrix_build_projection_perspective_fov(fov_y,aspect,znear,zfar);

