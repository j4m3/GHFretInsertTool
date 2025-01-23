//CONFIG
fret_clearance_depth = 2; //Clearance required at the back of the fret. Use GHFretClearanceTestingToolGenerator.scad to determine this. Unit = (mm).

generate_setting_tool = true; // Enable the generation of the setting tool. The setting tool is used to ensure you have removed enough material from the fret and the insert is seated to your specified "fret_clearance_depth". If the setting tool does not bottom out on the back of the fret, more material needs to be removed. . Unit = (true/false).

fret_depth = 13.2; //Internal depth  of the fret. The x and y dimensions of standard GH frets differs slightly between models however z appears to consistent. Measure the internal depth of your frets for accuracy. Unit = (mm).

//WHERE THE MAGIC HAPPENS

$fa = 0.5;
$fs = 0.5;
insert_w = 10.5;
insert_l = 13;
leg_w = 3;
leg_l = 3;
part_clearance = 4;
platform_thickness = 2;

for (dx=[0:insert_w+part_clearance:(insert_w+part_clearance)*4]) { //PLATE BUILDER
    translate([dx,0,0]) fret_insert();
        if (dx == (insert_w+part_clearance)*4 && generate_setting_tool){
            translate([dx + (insert_w + part_clearance) ,0,0])setting_tool();
        }
}
module fret_insert() { //insert GENERATOR
    for (xcor=[0:insert_w-leg_w:2*(insert_w-leg_w)-1])
        {
            for (ycor=[0:insert_w-leg_l:(insert_l-leg_l)-1])
                {
                    translate([xcor,ycor,platform_thickness])
                    leg();
        }
    }
        cube([insert_w, insert_l, platform_thickness]);
    translate([insert_w/2,insert_l,0]) cylinder(platform_thickness, insert_w/2, insert_w/2);
}

module leg(){
    leg_height = fret_depth -(fret_clearance_depth + platform_thickness);
    cube([leg_w, leg_l, leg_height]);
}

module setting_tool() { //SETTING TOOL GENERATOR
    cube([16, 15, 2]);
    translate([8,15]) cylinder(2, 8, 8);
    translate([2.5,0,2]) cube([insert_w, insert_l, fret_clearance_depth]);
    translate([(insert_w*0.5)+2.5,insert_l,2]) cylinder(fret_clearance_depth, insert_w*0.5, insert_w*0.5);
}