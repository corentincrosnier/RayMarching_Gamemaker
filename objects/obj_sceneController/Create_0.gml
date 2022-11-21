/// @description Insert description here
// You can write your code in this editor

enum SHAPES{
	BOX,
	SPHERE,
	MENGER,
	MANDELBULB,
	PLANE,
	ROUND_BOX
};
/*
global.obj={
	position:		array_create(0),
	rotation:		array_create(0),
	scale:			array_create(0),
	bodyColor:		array_create(0),
	surfaceColor:	array_create(0),
	specPower:		array_create(0),
	fractalIter:	array_create(0),
	planeNormal:	array_create(0),
	isEmitting:		array_create(0),
	emitColor:		array_create(0),
	type:			array_create(0),
	number:			0
};*/

global.scene={
	objects: {
		position:		array_create(0),
		rotation:		array_create(0),
		scale:			array_create(0),
		bodyColor:		array_create(0),
		surfaceColor:	array_create(0),
		specPower:		array_create(0),
		fractalIter:	array_create(0),
		planeNormal:	array_create(0),
		isEmitting:		array_create(0),
		emitColor:		array_create(0),
		type:			array_create(0),
		number:			0
	},
	skyColor: [0.3,0.3,0.7],
	ambientLightColor: [1.0,1.0,1.0]
};

/*
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
ds_map_add(objs,"number",0);*/


init_scene();

