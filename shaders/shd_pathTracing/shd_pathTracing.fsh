//
// Simple passthrough fragment shader
//



varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float radius=1.9;

float minDist = 0.0001;
float maxDist = 100.0;
int MAX_ITER = 10000;
const int MAX_OBJ = 20;
//#define MAX_OBJ=20;

uniform mat4 view;
uniform mat4 proj;

uniform int nbRay;
uniform int objNumber;
uniform vec3 objPos[MAX_OBJ];
//uniform vec3 objRot[MAX_OBJ];
uniform vec3 objScale[MAX_OBJ];
//uniform vec3 objDiffuseColor[MAX_OBJ];
uniform vec3 objSpecColor[MAX_OBJ];
uniform float objSpecPower[MAX_OBJ];
uniform int objFractalIter[MAX_OBJ];
uniform vec4 objPlaneNormal[MAX_OBJ];
uniform int objType[MAX_OBJ];
//uniform bool objIsEmitting[MAX_OBJ];
//uniform vec3 objEmitColor[MAX_OBJ];



const int	SHAPE_BOX=0,
			SHAPE_SPHERE=1,
			SHAPE_MENGER=2,
			SHAPE_MANDELBULB=3,
			SHAPE_PLANE=4,
			SHAPE_ROUND_BOX=5;
			
struct light{
	vec3 pos;
	float intensity;
	vec3 color;
};

struct hit{
	float d;
	int iter;
	vec3 hitPoint;
	vec3 Rdir;
};

/*
struct s_obj{
	vec4 pos;
	//vec4 rot;
	//vec4 scale;
	vec4 diffuseColor;
	vec4 specColor;
	float specPower;
	//int fractalIter;
	//int type;
};*/


float Pi=3.14159;
float epsilon=0.01;
vec3 objectDiffuse=vec3(0.5,0.85,0.38);
vec3 objectSpec=vec3(1.0,0.1,0.1);
float specPower=20.0;

float seed=123.1231;
float randN = 1.0;

float rand(){
	vec2 co = v_vTexcoord.xy + randN + seed;

	float A = 12.9898;
	float B = 78.233;
	float c = 43758.5453;
	float dt = dot(co.xy, vec2(A,B));
	float sn = mod(dt, 3.1415);
	randN += 0.587;
	return fract(sin(sn) * c);
}

vec2 box_muller(){
	float   r1 = rand();
	float   r2 = rand();
	float   tmp = sqrt(-2.0 * log(r1));
	vec2    d = vec2(tmp * cos(2.0 * Pi * r2), tmp * sin(2.0 * Pi * r2));

	return (d);
}

vec3 rand_dir(vec3 normal){
	float r1 = rand();
	float r2 = rand();

	float f = sqrt(1.0 - r2);
	vec3  dr_loc = vec3(cos(2.0 * Pi * r1) * f, sin(2.0 * Pi * r1) * f, sqrt(r2));
	vec3  vr = vec3(rand() - 0.5, rand() - 0.5, rand() - 0.5);
	vec3  tan1 = normalize(cross(normal, vr));
	vec3  tan2 = cross(tan1, normal);    return (dr_loc.z * normal + dr_loc.x * tan1 + dr_loc.y * tan2);
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




float mendelbulbSDF(vec3 v, int iter){
	float   dr, R;
	vec3    W, Z, z2, z4; 
	vec3    vp = v;
	if (v == vec3(0.0, 0.0, 0.0))
	v.z = 0.02;

	//v.x = (vp.x * cos(time * 2.0) - vp.z * sin(time * 2.0));
	//v.z = (vp.x * sin(time * 2.0) + vp.z * cos(time * 2.0));
	dr = 1.0;
	W = v;
	R = W.x * W.x + W.y * W.y + W.z * W.z;
	for(int i = 0; i < iter; i++){
		dr = 8.0 * sqrt(R * R * R * R * R * R * R) * dr + 1.0;
		Z = W;
		z2 = vec3(Z.x * Z.x, Z.y * Z.y, Z.z * Z.z);
		z4 = vec3(z2.x * z2.x, z2.y * z2.y, z2.z * z2.z);

		float k3 = z2.x + z2.z;
		float k2 = inversesqrt(k3*k3*k3*k3*k3*k3*k3);
		float k1 = z4.x + z4.y + z4.z - 6.0*z2.y*z2.z - 6.0*z2.x*z2.y + 2.0*z2.z*z2.x;
		float k4 = z2.x - z2.y + z2.z;

		W.x = v.x + 64.0 * Z.x * Z.y * Z.z * (z2.x - z2.z) * k4 * (z4.x - 6.0 * z2.x * z2.z + z4.z) * k1 * k2;
		W.y = v.y + -16.0 * z2.y * k3 * k4 * k4 + k1 * k1;
		W.z = v.z + -8.0 * Z.y * k4 * (z4.x * z4.x - 28.0 * z4.x * z2.x * z2.z + 70.0 * z4.x * z4.z - 28.0 * z2.x * z2.z * z4.z + z4.z * z4.z) * k1 * k2;

		//w.x += cos(time) * ((1684552.0 / 4) - (1684552.0 / 4)) * 3;
		//w.y += sin(time) * 1.7812 - cos(sqrt(time));
		//w.z -= 1.2 * cos(time) + sin(time) * 0.7;
		//w.x = (-sin(time) -cos(-time)) * w.x / 2.5;

		R = W.x * W.x + W.y * W.y + W.z * W.z;
		if (R > 256.0)
			return (0.25 * log(R) * sqrt(R) / dr);
	}   
	return (0.25 * log(R) * sqrt(R) / dr);
}

float planeSDF( vec3 Rp, vec4 n )
{
  // n must be normalized
  return abs(dot(Rp,n.xyz) + n.w);
} 

float sphereSDF(vec3 Rp){
	return length(Rp)-1.0;
}

float roundboxSDF( vec3 Rp, vec3 B, float R )
{
  vec3 Q = abs(Rp) - B;
  return length(max(Q,0.0)) + min(max(Q.x,max(Q.y,Q.z)),0.0) - R;
}

float sdBox(vec3 P, vec3 B)
{
  vec3 Q = abs(P) - B;
  return length(max(Q,0.0)) + min(max(Q.x,max(Q.y,Q.z)),0.0);
}

float maxcomp(vec2 v) {
  return (max(v.x, v.y));
}

float maxcomp(vec3 v) {
  return (max(max(v.x, v.y), v.z));
}

float sdCross(vec3 P)
{
  float da = maxcomp(abs(P.xy));
  float db = maxcomp(abs(P.yz));
  float dc = maxcomp(abs(P.zx));
  return min(da,min(db,dc))-1.0;
}

float mengerSDF(vec3 P, int iter)
{
  float d = sdBox(P,vec3(1.0));

  float S = 1.0;

  mat4  M;  
  vec3  axis = vec3(0.0, 1.0, 0.0);

  for( int m=0; m < iter; m++ )
  {
    //M = rotation_matrix(axis, radians(20));
    //p = (vec4(p, 1.0) * M).xyz;

    vec3 A = mod( P*S, 2.0 )-1.0;
    S *= 3.0;
    vec3 R = abs(1.0 - 3.0*abs(A));

    float da = max(R.x,R.y);
    float db = max(R.y,R.z);
    float dc = max(R.z,R.x);
    float c = (min(da,min(db,dc))-1.0)/S;

    d = max(d,c);
  }
  return (d);
}

void box_fold(inout vec3 Z, const float folding_limit)
{
  Z = clamp(Z, -folding_limit, folding_limit) * 2.0 - Z;
}

void sphere_fold(inout vec3 Z, inout float dz, const float min_radius, const float fixed_radius)
{   
  float R = dot(Z, Z);
    
  if (R < min_radius)
  { 
    float tmp = (fixed_radius / min_radius);
    Z *= tmp;
    dz *= tmp;
  } 
  else if (R < fixed_radius)
  { 
    float tmp = (fixed_radius / R);
    Z *= tmp;
    dz *= tmp;
  }
}

float mandelboxSDF(vec3 v)
{ 
    vec3    offset = v;
    float   dr = 1.2;
    float   scale = -1.3;
  
    for (int i = 0; i < 40; i++) {
        box_fold(v, 1.0);
        sphere_fold(v, dr, 0.3, 1.5);
        v = scale * v + offset;
       // orbitTrap = min(orbitTrap, abs(vec4(v,dot(v, v))));
        dr = dr * abs(scale) + 1.0;
    }
    return (length(v) / abs(dr));
}


float sdf(vec3 Rp){
	float sdf=maxDist;
	for(int i=0;i<objNumber;i++){
	//for(int i=0;i<1;i++){
		//int i=1;
		vec3 _Rp=Rp;
		_Rp=(_Rp-objPos[i])/objScale[i];
		
		/*_Rp=_Rp-objPos[i];
		_Rp.x=_Rp.x/objScale[i].x;
		_Rp.y=_Rp.y/objScale[i].y;
		_Rp.z=_Rp.z/objScale[i].z;*/
		
		if(objType[i]==SHAPE_BOX){
		}
		else if(objType[i]==SHAPE_SPHERE){
			
			float minScale=min(objScale[i].x, min(objScale[i].y, objScale[i].z));
			
			//sdf=min(sdf,sphereSDF(_Rp)*objScale[i]);
			sdf=min(sdf,sphereSDF(_Rp)*minScale);
		}
		else if(objType[i]==SHAPE_MENGER){
			float minScale=min(objScale[i].x, min(objScale[i].y, objScale[i].z));
			sdf=min(sdf,mengerSDF(_Rp,objFractalIter[i])*minScale);
		}
		else if(objType[i]==SHAPE_MANDELBULB){
			float minScale=min(objScale[i].x, min(objScale[i].y, objScale[i].z));
			sdf=min(sdf,mendelbulbSDF(_Rp,objFractalIter[i])*minScale);
		}
		else if(objType[i]==SHAPE_PLANE){
			//float minScale=min(objScale[i].x, min(objScale[i].y, objScale[i].z));
			sdf=min(sdf,planeSDF(Rp,objPlaneNormal[i]));
		}
		else if(objType[i]==SHAPE_ROUND_BOX){
			float minScale=min(objScale[i].x, min(objScale[i].y, objScale[i].z));
			sdf=min(sdf,roundboxSDF(_Rp,vec3(1.0,1.0,1.0),1.0)*minScale);
		}
	}
	return sdf;
	//Rp=Rp-objPos;
	//return sdRoundBox(Rp,vec3(0.5,0.5,0.5),0.1);
	//return mendelbulbSDF(Rp);
	//return min(sdRoundBox(Rp,vec3(0.6,0.6,0.6),0.05),mendelbulbSDF(Rp));
	//return max(sdRoundBox(Rp,vec3(0.6,0.6,0.6),0.05),sphereSDF(Rp));
	//return mengerSDF(Rp);
	//return mandelboxSDF(Rp);
	//return max(mandelboxSDF(Rp),sphereSDF(Rp));
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

vec3 getNormal(vec3 hit, vec3 Rdir){
	//vec3 A=marching(vec3(hit.x+,Rdir).hitPoint;
	//vec3 B=marching(hit,Rdir).hitPoint;
	
	/*
	float centerDistance = sdf(hit);
	float xDistance = sdf(hit + vec3(minDist/3.0, 0.0, 0.0));
	float yDistance = sdf(hit+ vec3(0.0, minDist/3.0, 0.0));
	float zDistance = sdf(hit + vec3(0.0, 0.0, minDist/3.0));
	vec3 normal = (vec3(xDistance, yDistance, zDistance) - centerDistance) / (minDist/3.0);
	return normalize(normal);
	*/
	float xDistance = sdf(hit + vec3(minDist/3.0, 0.0, 0.0)) - sdf(hit - vec3(minDist/3.0, 0.0, 0.0));
	float yDistance = sdf(hit + vec3(0.0, minDist/3.0, 0.0)) - sdf(hit - vec3(0.0, minDist/3.0, 0.0));
	float zDistance = sdf(hit + vec3(0.0, 0.0, minDist/3.0)) - sdf(hit - vec3(0.0, 0.0, minDist/3.0));
	return normalize(vec3(xDistance,yDistance,zDistance));
}


hit marching(vec3 OR, vec3 Rd){
	float d = 0.0;
	vec3 pos = OR;
	float ds = 0.0;
	//minDist=0.0001*sdf(pos);
	for (int i = 0; i < MAX_ITER; i++) {
		//ds = mendelbulbSDF(pos);
		//ds = max(mendelbulbSDF(pos),sphereSDF(pos));
		//ds = sdf(pos);
		ds = sdf(pos);
		//minDist=0.0001*d;
		if(d>maxDist){
			break;
		}
		if (ds < minDist){
			return hit(d,i,pos,Rd);
		}
		d += ds;
		pos = OR + Rd * d;
	}
	return hit(maxDist+1.0,MAX_ITER,vec3(0.0,0.0,0.0),Rd);
}


/*
vec3 reachLight(vec3 OR, vec3 normal, light l){
	vec3 lDir=normalize(l.pos-OR);
	hit h=marching(OR+normalize(OR)*minDist*3.0,lDir);
	float D=length(l.pos-OR);
	if(h.d>D){
		vec3 col=(l.color*l.intensity)/(4.0*Pi*D*D)*max(dot(normal,lDir),0.0);
		return col;
	}
	return vec3(0.0,0.0,0.0);
}
*/

vec3 reachLight(vec3 hitPoint, vec3 normal, light l, vec3 view){
	vec3 lDir=normalize(l.pos-hitPoint);
	hit h=marching(hitPoint+normal*minDist*3.0,lDir);
	float D=length(l.pos-hitPoint);
	if(h.d>D){
		//vec3 col=(l.color*l.intensity)/(4.0*Pi*D*D)*max(dot(normal,lDir),0.0)+objectDiffuse*max(dot(normal,lDir),0.0)+objectSpec*pow(max(dot(normal,reflect(lDir,normal)),0.0),specPower);
		vec3 col=objectDiffuse*(l.color*l.intensity)/(4.0*Pi*D*D)*max(dot(normal,lDir),0.0)+objectSpec*pow(max(dot(normal,reflect(lDir,normal)),0.0),specPower);
		return col;
	}
	return vec3(0.0,0.0,0.0);
}



vec4 gammaCorrect(vec4 color){
    float gamma = 2.2;
    color.rgb = pow(color.rgb, vec3(1.0/gamma));
	return color;
}



void main()
{
	/*light lights[3] = light[3](light(vec3(2.0,2.0,0.0),50.0,vec3(1.0,0.0,0.5)),
								light(vec3(2.0,-2.0,0.0),50.0,vec3(1.0,0.6,1.0)),
								light(vec3(-2.0,-2.0,2.0),50.0,vec3(0.3,0.2,1.0)));*/
								
	/*		
	light l2=light(vec3(0.0,-1.0,-4.0),100.0,vec3(0.9,1.0,0.9));
	light l3=light(vec3(0.0,2.0,-2.0),10.0,vec3(0.9,0.5,0.85));*/
	
	vec3 OR=(view*vec4(0.0,0.0,0.0,1.0)).xyz;
	light l1=light(OR,2.0,vec3(0.9,0.55,0.95));
	vec2 pixel=v_vTexcoord+box_muller()/100.0-vec2(0.5,0.5);
	vec4 target = proj * vec4(pixel, 1.0, 1.0);
	vec3 Rd = normalize((view * vec4(normalize(target.xyz), 0.0)).xyz);
	vec4 color;
	hit h=marching(OR,Rd);
	

	if(h.d<maxDist && h.iter<MAX_ITER){
		//vec3 lightCol=vec3(0.0,0.0,0.0);
		//marching(h.hitPoint+normal*minDist*3.0)
		
		
		vec3 normal=getNormal(h.hitPoint,h.Rdir);
		
		//lightCol+=reachLight(h.hitPoint,normal,l1,normalize(OR));
		//lightCol+=reachLight(h.hitPoint,normal,l2,normalize(OR));
		//lightCol+=reachLight(h.hitPoint,normal,l3,normalize(OR));
		//color=gammaCorrect(vec4(lightCol,1.0));
		
		
		//color=vec4(1.0/sqrt(float(h.iter)),1.0/float(h.iter),1.0/float(h.iter),1.0);
		color+=gammaCorrect(vec4(vec3(1.0/sqrt(float(nbRay+1))),1.0));
		//color=vec4(1.0,1.0,1.0,1.0);
		
	}
	else
		color=vec4(1.0,0.1,0.1,1.0);
	/*if(nbRay>0)
		gl_FragColor=(color+v_vColour*float(nbRay))/float(nbRay+1);
	else
	*/
	gl_FragColor=color;
}
