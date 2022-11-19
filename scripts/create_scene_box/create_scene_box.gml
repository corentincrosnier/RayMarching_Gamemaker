// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_scene_box(){
	array_push(objs[?"pos"],[0,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"planeNormal"],[0,-1,0,10]);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
	
	array_push(objs[?"pos"],[1,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"planeNormal"],[0,1,0,10]);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
	
	array_push(objs[?"pos"],[1,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"planeNormal"],[0,0,-1,10]);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
	
	array_push(objs[?"pos"],[1,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"planeNormal"],[0,0,1,10]);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
	
	array_push(objs[?"pos"],[1,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"planeNormal"],[1,0,0,10]);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
	
	array_push(objs[?"pos"],[1,0,0]);
	array_push(objs[?"rot"],[0,0,0]);
	array_push(objs[?"scale"],[1,1,1]);
	array_push(objs[?"diffuse"],[0.8,0.8,0.8]);
	array_push(objs[?"spec"],[1,1,1]);
	array_push(objs[?"specPower"],10);
	array_push(objs[?"fractalIter"],1);
	array_push(objs[?"planeNormal"],[-1,0,0,10]);
	array_push(objs[?"isEmitting"],0);
	array_push(objs[?"type"],SHAPES.PLANE);
	objs[?"number"]+=1;
}