LPChocV1();

 module LPChocV1(){
    sf_min_d = 12.4;
    sf_min_w = 12.2;
    sf_max_d = 13.8;
    sf_max_w = 13.6;
    sf_step_h = 0.5;
    sf_h = 1.5;
    sm_d = 15;
    sm_w = 15;
    sm_h = 0.8;
    sr_d = 13.8;
    sr_w = 13.8;
    sr_h = 2.2;
     
    linear_extrude(sr_h) square([sr_w, sr_d], center=true);
    translate([-sm_w*0.5, -sm_d*0.5, sr_h]) cube([sm_w, sm_d, sm_h]);
    translate([-sf_max_w*0.5, -sf_max_d*0.5, sr_h+sm_h]) cube([sf_max_w, sf_max_d, sf_step_h]);
    translate([-sf_max_w*0.5, -sf_max_d*0.5, sr_h+sm_h+sf_step_h])
     polyhedron(
        points=[
        [0, 0, 0],
        [sf_max_w, 0, 0],  
        [sf_max_w, sf_max_d, 0], 
        [0, sf_max_d, 0],
     
        [(sf_max_w-sf_min_w)*0.5, (sf_max_d-sf_min_d)*0.5, sf_h+sm_h], 
        [(sf_max_w-sf_min_w)*0.5, ((sf_max_d-sf_min_d)*0.5)+sf_min_d, sf_h+sm_h], 
        [((sf_max_w-sf_min_w)*0.5)+sf_min_w, ((sf_max_d-sf_min_d)*0.5)+sf_min_d, sf_h+sm_h], 
        [((sf_max_w-sf_min_w)*0.5)+sf_min_w, ((sf_max_d-sf_min_d)*0.5), sf_h+sm_h]],
        faces=[
        [0,1,2,3],
        [4,5,6,7],
        [0,4,7,1],
        [3,5,4,0],
        [2,6,5,3],
        [1,7,6,2]]
    );
}
 