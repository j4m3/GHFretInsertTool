<p align="center"><img src="https://github.com/user-attachments/assets/00cd7fcf-d0c0-481f-ac1a-ef29dacd8f3c" width=75% height=75%></p>

# GHFretInsertTool (OpenSCAD Project)

When guitar hero controllers are modded to use mechanical key switches on the fret buttons, modifications are generally required due to clearance issues between the back of the fret and the thicker mechanical switch. These modified frets are usually 3d printed, resin cast or original GH fret buttons that have been adapted to suit the specific switch setup.

## Project Info

I find the original fret buttons and colours iconic to the GH franchise, so when modifying a Wii LP and Wii GH5 guitar (Shout out to the Santroller project https://github.com/Santroller) the original fret buttons had to stay! This means modifying (RE: cutting) the back of the original fret buttons to make room for the mechanical key switch, This is typically achieved by hand or using a rotary tool (Dremel). However this process needs to be performed accurately/consistently to ensure uniform switch feel/travel across all five fret buttons, not easy with a rotary tool, very difficult by hand!

This project allows for the bulk of the material to be removed from back of the fret (using what ever caveman era tools are deemed necessary) without needing to worry about dimensional accuracy (much easier with basic tools/hand tools). A combination of [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) and [GHFretInsertGenerator.scad](OpenSCADFiles/GHFretInsertGenerator.scad) (or the pre rendered [stl's](STLs)) can then be used to determine the correct clearance offset for your specific switch setup then generate five identical inserts and a setting tool to backfill the fret button and ensure consistency across all five.

To test a "worst case" scenario i.e a situation where only **basic** hand tools are available. I used a pair of stubby needle nose pliers to grab and twist material from the back of a fret in small chunks. Although this was time consuming, it was 100% effective and **very** easy to do! See the [images](#images) section (image 2 and 3) to see an absolutely butchered blue Wii LP fret with its perfect 6mm (ish) worth of switch clearance.

## Usage:
1. Hog out the back of your fret buttons. Remove as much as you can, there is some clearance to allow for some material to be missed so it doesn't have to be neat.
2. Use GHFretClearanceTestingToolGenerator.scad to generate some testing inserts, these can be generated with a switch clearance anywhere from 0 to 13mm (The approx. max depth of a GH fret). Insert these numbers side up. The number on the insert indicates the "fret_clearance_depth" or the distance between the insert face and the back of the button. Ensure your deepest clearance insert fits by using the setting tool to push the insert into the back of the fret button, if the setting tool does not seat fully on the back of the button either more material needs to be removed or `fret_depth` is incorrect.
3. Reassemble your guitar neck including your switches and PCB/switch fixture to test if you have enough or too much clearance, size up or down as required. If you perform step 1 to all switches at once you can fit different depth inserts in each fret to see which "feels" the best.
4. Once the optimal button clearance value has been found GHFretInsertGenerator.scad can then be used to generate 5 identical inserts and a setting tool. 
5. Insert the... inserts into your freshly cut frets using the setting tool to ensures that each insert seats into the back of the button properly. Glue can be used to hold each insert in place once you are happy.

## Notes:
* This is my first time using OpenSCAD so this is probably poorly optimised and a bit scruffy but its good enough for the kind of girls I go out with!

* This project SHOULD work on LP, GH5, WT and WoR and TG/Non-TG guitars. From the buttons I have on hand, the external dimensions differ slightly between models but the internal dimensions are more consistent including the internal depth of the button. You should measure and verify this however adjusting  `fret_clearance_depth` as required.

* [GHFretClearanceTestingToolGenerator.scad](OpenSCADFiles/GHFretClearanceTestingToolGenerator.scad) allows for the specification of `depth_step` which controls the height difference between each insert. This could also be used to test the difference in switch feel/actuation down to your printers minimum layer height. For example testing a button with 2mm of clearance vs 2.12mm. This could also allow for the creation of hair triggers by tuning a buttons' clearance to JUST before the switches' actuation point if that's your jam.

* The testing tool inserts are generated with notches top and bottom, these allow for it to be grabbed with pliers or similar if it binds in the button during testing.

## Images
1. **Unmodified fret along with a 4mm insert and setting tool:**

<img src="https://github.com/user-attachments/assets/f5a2b73a-2efc-4bde-83b5-1e3585bf4bde" width=50% height=50%>


2. **Modified no insert. This looks like it was done with a completely blunt instrument because it was.**

<img src="https://github.com/user-attachments/assets/94c0cae3-f275-4927-9b8d-1f613a734f3b" width=50% height=50%>


3. **Modified with 6mm insert. Switch now has a consistent 6mm (ish) clearance down into the fret body, also hides the crimes committed in image 2.**

<img src="https://github.com/user-attachments/assets/bb4329bd-ac38-4bf6-857f-eaec124af92a" width=50% height=50%>


https://github.com/j4m3/GHFretInsertTool/blob/main/OpenSCAD/GHFretClearanceTestingToolGenerator.scad
