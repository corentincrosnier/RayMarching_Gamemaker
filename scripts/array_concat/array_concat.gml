
function array_concat2(arr){

var l=array_length(arr);
var r=array_create(0);
for(var i=0;i<l;i++){
	array_copy(r,array_length(r),arr[i],0,array_length(arr[i]));
}
return r;

/*
if(!is_array(arr1) || !is_array(arr2))
	return 0;

var a = argument0;
var b = argument1;
var al = array_length(a);
var bl = array_length(b);
if(al==0 && bl=0){
	return 0;
}
var r = array_create(al + bl);
array_copy(r, 0, a, 0, al);
array_copy(r, al, b, 0, bl);
return r;
*/
}