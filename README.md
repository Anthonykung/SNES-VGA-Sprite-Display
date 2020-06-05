# SNES VGA Sprite Display Version 4.0

## Thanks for using SNES VGA Sprite Display Version 4.0
Let's see if we can help you out! Here's some of the documentations on how to use this package.

## How To Use
There are two folders in this package, Project HDL Files and Simulation Do Files. The Project HDL Files contains
the actual HDL files for the package in both SystemVerilog and Verilog format. The Simulation Do Files contains
the ModelSim simulation commands that you can use to simulate this package easily. The process of doing both are
different, below are the different process of using this package.

### Quartus
For implementing on Quartus, load everything in the Project HDL Files folder to Quartus. Open VGA_Display.v in
Quartus, create a symbol file for it. Go on to your top level schematic file (if you do not have one, you will
need to create a new schematic file) and place the VGA_Display block in, be sure to connect all the ports to
your inputs and outputs, outputs are the VGA ports on your FPGA.

### ModelSim
For simulation, load the .sv and .v files from the Project HDL Files into ModelSim ONLY, adding other files may
cause errors. Your ModelSim Default Library Name should be named EXACTLY `work`. Go to Simulation Do Files and
select the component you want to test. Copy the full file path, go back to ModelSim at the command bar, type

`do /path/to/folder/Simulation\ Do\ Files/Selected_Component.do`

Created with 💖 By [Anthony Kung](https://hailiga.org/anthonykung)
