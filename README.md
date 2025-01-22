 GHFretSpacerTool (OpenS CAD Project)

## Intro

When guitar hero controllers are modified to include mechanical key switches on the fret buttons modifications are generally required due to clearance issues between the back of the button, switch and PCB. These modified buttons are usually 3d printed, resin cast or original GH buttons that have been adapted to suit the specific switch setup.

## Project Info

I find the original buttons (AND button colours) iconic to the GH franchise! So when modifying a Wii LP and Wii GH5 guitar they had to stay! This means modifying (RE: cutting) the back of the original buttons to make room for the mechanical key switch, This is typically achieved by hand or using a rotary tool. However this process needs to be performed as consistently as possible to all 5 buttons. This is to ensure uniform button feel/travel across all five buttons, not easy with a rotary tool, very difficult by hand!

That's where GHFretSpacerTool comes in, this project allows for the bulk of the material to be removed from the button (using which ever caveman tools are deemed necessary) with no regards for dimensional accuracy (much easier with basic tools). Then a combination of GHFretClearanceTestingToolGenerator.scad and GHFretSpacerGenerator.scad (or the pre rendered stl's) can be used to determine the correct clearance offset for the specific switch setup. Then generate five identical spacers and a setting tool to ensure consistency across all buttons.

## Usage:
1. Hog out the back of your fret buttons. Get as much material as you can out of there. Mind those fingers!
2. Use GHFretClearanceTestingToolGenerator.scad to generate a suite of testing spacers, these can be generated with a switch clearance anywhere from 0 to 13mm (The approx. max depth of a GH button). Insert these numbers side up. The number on the spacer indicates the "fret_clearance_depth" or the offset between the spacer and the back of the button.
3. Once the optimal button clearance value has been found GHFretSpacerGenerator.scad can then be used to generate 5 identical spacers and a setting tool. The setting tool ensures that each spacer seats into the back of the button properly, if the setting tool does not seat fully on the back of the button either more material needs to be removed OR "fret_depth" is incorrect. Glue can be used to hold each spacer in place once you are happy.

## Notes:
* First time using OpenSCAD so this is probably poorly optimised and a bit scruffy.

* This project SHOULD work on LP, GH5, WT and WoR and TG/Non-TG guitars. From the buttons I have on hand, the external dimensions differ slightly between models but the internal dimensions are more consistent including the internal depth of the button. You should measure and verify this however adjusting "fret_clearance_depth" as required.

* GHFretClearanceTestingToolGenerator.scad also allows for the specification of "depth_step" which controls the height difference between each spacer. This could also be used to test the difference in switch feel and actuation point down to your printers minimum layer height. For example testing a button with 2.2mm of clearance vs 2.4. This could also allow for the creation of hair triggers by tuning the buttons' clearance to JUST before the switches' actuation point if thats your thing.

* The testing tool spacers are generated with notches top and bottom, these allow the spacer to be removed using pliers or similar if it binds in the button during fitment.