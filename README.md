GHFretInsertTool (OpenSCAD Project)

## Intro

When guitar hero controllers are modded to use mechanical key switches on the fret buttons, modifications are generally required due to clearance issues between the back of the button and the thicker mechanical switch. These modified buttons are usually 3d printed, resin cast or original GH buttons that have been adapted to suit the specific switch setup.

## Project Info

I find the original buttons (AND button colours) iconic to the GH franchise, so when modifying a Wii LP and Wii GH5 guitar ((Shout out to the Santroller project https://github.com/Santroller) the original buttons had to stay! This means modifying (RE: cutting) the back of the original buttons to make room for the mechanical key switch, This is typically achieved by hand or using a rotary tool (Dremel). However this process needs to be performed accurately/consistently to ensure uniform button feel/travel across all five buttons, not easy with a rotary tool, very difficult by hand!

This project allows for the bulk of the material to be removed from back of the button (using what ever caveman era tools are deemed necessary) without needing to worry about dimensional accuracy (much easier with basic tools/hand tools). A combination of GHFretClearanceTestingToolGenerator.scad and GHFretInsertGenerator.scad (or the pre rendered stl's) can then be used to determine the correct clearance offset for your specific switch setup then generate five identical inserts and a setting tool to backfill the switch and ensure consistency across all the fret buttons.

## Usage:
1. Hog out the back of your fret buttons. Remove as much material as you can, there is some clearance to allow for some material to be missed but it doesn't have to be neat. Mind those fingers!
2. Use GHFretClearanceTestingToolGenerator.scad to generate some testing inserts, these can be generated with a switch clearance anywhere from 0 to 13mm (The approx. max depth of a GH button). Insert these numbers side up. The number on the insert indicates the "fret_clearance_depth" or the distance between the insert face and the back of the button. Ensure your deepest clearance insert fits by using the setting tool to push the insert into the back of the fret button, if the setting tool does not seat fully on the back of the button either more material needs to be removed OR "fret_depth" is incorrect.
3. Reassemble your guitar neck including your switches and PCB/switch fixture to test if you have enough or too much clearance, size up or down as required. If you perform step 1 to all switches at once you can fit different depth inserts in each button to see which "feels" the best.
4. Once the optimal button clearance value has been found GHFretInsertGenerator.scad can then be used to generate 5 identical inserts and a setting tool. 
5. Insert the... inserts into your freshly cut frets using the setting tool to ensures that each insert seats into the back of the button properly. Glue can be used to hold each insert in place once you are happy.

## Notes:
* This is my first time using OpenSCAD so this is probably poorly optimised and a bit scruffy, but its good enough for the kind of girls I go out with!

* This project SHOULD work on LP, GH5, WT and WoR and TG/Non-TG guitars. From the buttons I have on hand, the external dimensions differ slightly between models but the internal dimensions are more consistent including the internal depth of the button. You should measure and verify this however adjusting "fret_clearance_depth" as required.

* GHFretClearanceTestingToolGenerator.scad allows for the specification of "depth_step" which controls the height difference between each insert. This could also be used to test the difference in switch feel/actuation down to your printers minimum layer height. For example testing a button with 2mm of clearance vs 2.12mm. This could also allow for the creation of hair triggers by tuning the buttons' clearance to JUST before the switches' actuation point if that's your jam.

* The testing tool inserts are generated with notches top and bottom, these allow for it to be grabbed with pliers or similar if it binds in the button during testing.