//GH

//CONFIG
fret_clearance_depth_min = 2; //Minimum fret clearance to generate. For example "fret_clearance_depth_min = 0" would generate the first spacer that is flush with the back of the fret. Input: mm

fret_clearance_depth_max = 8; //Maximum fret clearance to generate. Input: mm

depth_step = 1; // Define the depth difference between each test spacer. For example, "depth_step=0.5" generates spacers at 0.5mm incriments. Input: mm

generate_setting_tool = true; // Enable the generation of the setting tool. The setting tool is used to ensure enough material has been removed from the fret to allow the spacer to properly seat. Setting tool is generated for deepest specified offset. If the deepest generated offset seats properly, you are good to go, If not, remove more material. Input = true/false

fret_depth = 13.2; //Internal depth  of thr fret. The x and y dimentions of standard GH frets differs slightly between models however z appears to consistant. Measure the internal depth of your frets to verify. Unit = mm

//WHERE THE MAGIC HAPPENS

$fa = 1;
$fs = 1;
platform_thickness = 2;
spacer_w = 11;
spacer_l = 13;
support_w = 3;
support_l = 3;

spacer_generator(step_counter = 0, fret_clearance_depth = fret_clearance_depth_min, fret_clearance_depth_max = fret_clearance_depth_max , depth_step = depth_step);

module spacer_generator(step_counter, fret_clearance_depth, fret_clearance_depth_max, depth_step){
    x_spacing = spacer_w+4;
    if (fret_clearance_depth<=fret_clearance_depth_max){
        translate([(x_spacing*step_counter),0,0]) fret_spacer(fret_clearance_depth);
        spacer_generator(step_counter + 1, fret_clearance_depth + depth_step, fret_clearance_depth_max, depth_step);
        }
    if (fret_clearance_depth==fret_clearance_depth_max && generate_setting_tool){
        translate([((x_spacing*step_counter)+ spacer_w +4),0,0]) setting_tool(fret_clearance_depth);
        }
}

module fret_spacer(fret_clearance_depth) {
    for (xcor=[0:spacer_w-support_w:2*(spacer_w-support_w)-1]){
        for (ycor=[0:spacer_w-support_l:(spacer_l-support_l)-1]){
            translate([xcor,ycor,platform_thickness])
            support(fret_clearance_depth);
        }
    }
    clearance_text = str(fret_clearance_depth);
    difference(){
        union() {
            difference(){
                cube([spacer_w, spacer_l, platform_thickness]);
                translate([support_w,0,0])
                cube([spacer_w-(2*support_w), support_l, platform_thickness]);
            }
            difference(){
                translate([spacer_w*0.5,spacer_l,0])
                cylinder(platform_thickness, spacer_w*0.5, spacer_w*0.5);
                translate([support_w,spacer_l+((spacer_w*0.5)-support_l),0])
                cube([spacer_w-(2*support_w), support_l, platform_thickness]);
            }
        }
        mirror([1,0,0])
        rotate(270)
        translate([-((spacer_l+(spacer_w*0.5))*0.5),-(spacer_w*0.5),0])
        linear_extrude(0.2)text
        (text = clearance_text, size = 5, valign = "center", halign = "center");
    }
}

module support(fret_clearance_depth){
    support_height = fret_depth -(fret_clearance_depth + platform_thickness);
    cube([support_w, support_l, support_height]);
}
    
module setting_tool(fret_clearance_depth) { //SETTING TOOL GENERATOR
    clearance_text = str(fret_clearance_depth);
    translate([2.5,0,2])
    cube([spacer_w, spacer_l, fret_clearance_depth]);
    translate([(spacer_w*0.5)+2.5,spacer_l,2])
    cylinder(fret_clearance_depth, spacer_w*0.5, spacer_w*0.5);
    difference(){
        union(){
            cube([16, 15, 2]);
            translate([8,15]) cylinder(2, 8, 8);
        }
        mirror([1,0,0])
        rotate(270)
        translate([-(11.75),-(8),0])
        linear_extrude(0.2)
        text(text = clearance_text, size = 7, valign = "center", halign = "center");
    }    
}