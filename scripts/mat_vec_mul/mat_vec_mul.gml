// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mat_vec_mul(mat,w,h,vec){
	if(w==array_length(vec)){
		var a=array_create(h);
		var i,j=0;
		for(i=0;i<h;i++){
			a[i]=0;
		}
		for(i=0;i<h;i++){
			for(j=0;j<w;j++){
				a[i]+=mat[j+i*w]*vec[j];
			}
		}
		return a;
	}
	else return 0;
}