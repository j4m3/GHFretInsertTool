//CONFIG
fret_clearance_depth = 4; //Depth required at the back of the fret. Unit = (mm).

generate_setting_tool = true; // Enable the generation of the setting tool. The setting tool is used to ensure you have removed enough material from the fret and the spacer is seated to your specified "fret_clearance_depth". If the setting tool does not bottom out on the back of the fret, more material needs to be removed. . Unit = (true/false).

//ADVANCED CONFIG
fret_depth = 13.2; //Internal depth  of thr fret. The x and y dimentions of standard GH frets differs slightly between models however z appears to consistant. Measure the internal depth of your frets for acuracy. Unit = (mm).

platform_thickness = 2;

//WHERE THE MAGIC HAPPENS

$fa = 1;
$fs = 0.4;
spacer_w = 11;
spacer_l = 13;
leg_w = 3;
leg_l = 3;

for (dx=[0:14:69]) { //PLATE BUILDER
    translate([dx,0,0]) fret_spacer();
        if (dx == 56 && generate_setting_tool){
            translate([dx + 18,0,0])setting_tool();
        }
}
module fret_spacer() { //SPACER GENERATOR
    for (xcor=[0:spacer_w-leg_w:2*(spacer_w-leg_w)-1])
        {
            for (ycor=[0:spacer_w-leg_l:(spacer_l-leg_l)-1])
                {
                    translate([xcor,ycor,platform_thickness])
                    leg();
        }
    }
        cube([spacer_w, spacer_l, platform_thickness]);
    translate([spacer_w/2,spacer_l,0]) cylinder(platform_thickness, spacer_w/2, spacer_w/2);
}

module leg(){
    leg_height = fret_depth -(fret_clearance_depth + platform_thickness);
    cube([leg_w, leg_l, leg_height]);
}

module setting_tool() { //SETTING TOOL GENERATOR
    cube([16, 15, 2]);
    translate([8,15]) cylinder(2, 8, 8);
    translate([2.5,0,2]) cube([spacer_w, spacer_l, fret_clearance_depth]);
    translate([(spacer_w/2)+2.5,spacer_l,2]) cylinder(fret_clearance_depth, spacer_w/2, spacer_w/2);
}