<p align="center"><img src="https://github.com/user-attachments/assets/00cd7fcf-d0c0-481f-ac1a-ef29dacd8f3c" width=75% height=75%></p>

# GHFretInsertTool - Mechanical switches with standard GH buttons.(OpenSCAD Project)

When guitar hero controllers are modded to use mechanical key switches on the fret buttons, modifications are generally required due to clearance issues between the back of the fret and the thicker mechanical switch. These modified frets are usually 3d printed, resin cast or original GH fret buttons that have been adapted to suit the specific switch setup. The modification of original fret buttons is typically achieved using a rotary tool (Dremel), drill or by hand. However, this process needs to be performed accurately/consistently to each fret button to ensure uniform switch feel/travel across all five buttons, not easy with a rotary tool, very difficult by hand!

## Project Info

This project allows for the bulk of the material to be removed from back of the fret (using what ever caveman era tools are deemed necessary) without needing to worry about dimensional accuracy (much easier with basic tools/hand tools). A combination of [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) and [GHFretInsertGenerator.scad](OpenSCADFiles/GHFretInsertGenerator.scad) (or the pre rendered [STL's](STLs)) can then be used to determine the correct clearance offset for your specific switch setup then generate five identical inserts and a setting tool to backfill the fret button and ensure consistency across all five.

Clearance on the left and right side of the back of the fret will likely need to be created depending on your key switch dimensions. Kailh choc V1's do require more clearance for the switch body if a PCB is used in the standard position.

To test a "worst case" scenario i.e a situation where only **basic** hand tools are available. I used a pair of stubby needle nose pliers to grab and twist material from the back of a fret in small chunks. Although this was time consuming, it was 100% effective and **very** easy to do! See the [images](#images) section (image 2 and 3) to see an absolutely butchered blue Wii LP fret with its perfect 6mm (ish) worth of switch clearance.

## Usage:
1. Hog out the back of your fret buttons. Remove as much as you can, there is some clearance to allow for some material to be missed so it doesn't have to be neat.
2. Use [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) to generate some testing inserts (or pre-rendered testing tool [STL's](STLs)), these can be generated with a switch clearance anywhere from 0mm to 11mm (The approx. max depth of a GH fret is 13mm, the platform thickness is 2mm, this can be modified in varible `platform_thickness`). Insert these numbers side up. The number on the insert indicates the `fret_clearance_depth` (distance between the insert face and the back of the button). Ensure your deepest clearance insert fits by using the setting tool to push the insert into the back of the fret button, if the setting tool does not seat fully on the back of the button either more material needs to be removed.
3. Reassemble your guitar neck including your switches and PCB/switch fixture to test if you have enough or too much clearance, size up or down as required. If you perform step 1 to all switches at once you can fit different depth inserts in each fret to see which "feels" the best. You are looking to find an offset that gives optimal button travel while ensuring the key switch is still activates (see [Note 3](#notes) for details regarding switch travel)
4. Once the optimal button clearance value has been found [GHFretInsertGenerator.scad](OpenSCADFiles/GHFretInsertGenerator.scad) can then be used to generate 5 identical inserts at your desired offset and a setting tool. 
5. Insert the... inserts into your freshly cut frets using the setting tool to ensures that each insert seats into the back of the button properly. Glue can be used to hold each insert in place once you are happy.



## Notes
* This is my first time using OpenSCAD so this is probably poorly optimised and a bit scruffy but its good enough for the kind of girls I go out with!

* This project SHOULD work on LP, GH5, WT and WoR and TG/Non-TG fret buttons. From the buttons I have on hand, the external dimensions differ slightly between models but the internal dimensions are more consistent including the internal depth of the button. You should measure and verify this however adjusting  `fret_clearance_depth` as required.

* A standard rubber dome fret button has arround 1.2mm to 1.4mm of total travel. A low profile key switch, for example a Kailh choc v1 has 2.5mm of travel. You likely do not want 2.5mm of fret travel before the switch triggers the key press. Multiple testing inserts are generated (with different offsets) as you may prefer more or less fret travel. [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) was written with a low profile choc v1 on a PCB mount in mind however any arbitrary `fret_clearance_depth` can be specified.

* [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) allows for the specification of `depth_step` which controls the height difference between each insert. This could be used to test the difference in switch feel/actuation down to your printers minimum layer height. For example testing a button with 2mm of clearance vs 2.12mm. This could also allow for the creation of hair triggers by tuning a buttons' clearance to JUST before the switches' actuation point.

* The testing tool inserts are generated with notches top and bottom, these allow for it to be grabbed with pliers or similar if it binds in the button during testing.

## Images
1. **Unmodified fret along with a 4mm insert and setting tool:**

<img src="https://github.com/user-attachments/assets/f5a2b73a-2efc-4bde-83b5-1e3585bf4bde" width=50% height=50%>


2. **Modified no insert. This looks like it was done with a completely blunt instrument because it was.**

<img src="https://github.com/user-attachments/assets/94c0cae3-f275-4927-9b8d-1f613a734f3b" width=50% height=50%>


3. **Modified with 6mm insert. Switch now has a consistent 6mm (ish) clearance down into the fret body, also hides the crimes committed in image 2.**

<img src="https://github.com/user-attachments/assets/bb4329bd-ac38-4bf6-857f-eaec124af92a" width=50% height=50%>


https://github.com/j4m3/GHFretInsertTool/blob/main/OpenSCAD/GHFretClearanceTestingToolGenerator.scad
