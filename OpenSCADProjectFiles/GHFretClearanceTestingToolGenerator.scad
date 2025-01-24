//CONFIG
fret_clearance_depth_min = 1.2; //Minimum fret clearance to generate. For example "fret_clearance_depth_min = 0" would generate the first insert that is flush with the back of the fret. Input: mm

fret_clearance_depth_max = 2.6; //Maximum fret clearance to generate. This will depend on your key switch travel and posistion Input: mm

depth_step = 0.2; // Define the depth difference between each test insert. For example, "depth_step=0.2" generates inserts at 0.2mm increments. You can take this down to your printers minimum layer height. Input: mm

fret_depth = 13.2; //Internal depth  of the fret. The x and y dimensions of standard GH frets differs slightly between models however z appears to consistent. Measure the internal depth of your frets to verify. Unit = mm

//WHERE THE MAGIC HAPPENS

$fa = 1;
$fs = 1;
platform_thickness = 2;
insert_w = 10.5;
insert_l = 13;
support_w = 3;
support_l = 3;
part_clearance = 4;

insert_generator(0, fret_clearance_depth_min, fret_clearance_depth_max, depth_step);

module insert_generator(step_counter, fret_clearance_depth, fret_clearance_depth_max, depth_step){
    x_spacing = insert_w+part_clearance;
    if (fret_clearance_depth<=(fret_clearance_depth_max+depth_step)){
        translate([(x_spacing*step_counter),0,0]) fret_insert(fret_clearance_depth);
        insert_generator(step_counter + 1, fret_clearance_depth + depth_step, fret_clearance_depth_max, depth_step);
    }
    else{
        {
        translate([((x_spacing*step_counter)+ part_clearance),0,0]) setting_tool(fret_clearance_depth-depth_step);
        }
    }
}

module fret_insert(fret_clearance_depth) {
    for (xcor=[0:insert_w-support_w:2*(insert_w-support_w)-1]){
        for (ycor=[0:insert_w-support_l:(insert_l-support_l)-1]){
            translate([xcor,ycor,platform_thickness])
            support(fret_clearance_depth);
        }
    }
    clearance_text = str(fret_clearance_depth);
    difference(){
        union() {
            difference(){
                cube([insert_w, insert_l, platform_thickness]);
                translate([support_w,0,0])
                cube([insert_w-(2*support_w), support_l, platform_thickness]);
            }
            difference(){
                translate([insert_w*0.5,insert_l,0])
                cylinder(platform_thickness, insert_w*0.5, insert_w*0.5);
                translate([support_w,insert_l+((insert_w*0.5)-support_l),0])
                cube([insert_w-(2*support_w), support_l, platform_thickness]);
            }
        }
        mirror([1,0,0])
        rotate(270)
        translate([-((insert_l+(insert_w*0.5))*0.5),-(insert_w*0.5),0])
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
    translate([2.5,1,2])
    cube([insert_w, insert_l, fret_clearance_depth]);
    translate([(insert_w*0.5)+2.5,insert_l+1,2])
    cylinder(fret_clearance_depth, insert_w*0.5, insert_w*0.5);
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