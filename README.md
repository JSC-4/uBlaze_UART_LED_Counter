# MicroBlaze LED Counter using UART with Nexys-4 DDR

This project is about using the Nexys-4 DDR, to create a MicroBlaze SoC and communicating with the UART.A Custom IP of an LED
Counter was created, whcih is then controlled by the UART core, running on the MicroBlaze processor. 

### Prerequisites

* MicroBlaze compatible FPGA board
* Vivado with license

## Getting Started

### Vivado

```
1. Create a new project. As no RTL sources are not used "Do not specify sources at this time" can be checked.
   Select the FPGA board used and finish building the project.
2. To make a new IP, go to tool->Create and Package New IP. Pick "Create Axi4 Preipheral", can change name of IP and other
   details on the "Peripheral Details" window. On the last page, click "Edit IP" and click finish.
3. Click "Add Sources" and add the VHDL file found here: [LED_Counter] (www.google.com).
3. Add an AXI GPIO core, double click on the ip block, add dip switches in GPIO. Do the same for another AXI 
   GPIO core but add LEDs to GPIO. Run connection automation, validate the design, create a HDL wrapper 
   (if not already created) and generate bitstream.
4. Once bitstream is generated, go to file->export->export hardware and make sure INCLUDE BITSTREAM is checked.
5. File->Launch SDK
```

### SDK

```
1. When launched in SDK from Vivado, make sure the hw wrapper folder can be seen in the projext explorer window.
2. File->new->application project. Name the project and ensure the target harware is the same as the hw wrapper.
   In the next window pick Hello World template and finish.
3. Go to the helloworld.c (can change the name to something more appropriate) file from the application project 
   folder, in the src folder. To read GPIO three steps need to be done. 1) Initialise the GPIO, 2) Set data direction,
   3) Read data. Various online documents can describe this in detail, such as Xilinx's Writing Basic Software
   Application (see additional comments below).
4. Once this is done click program FPGA, then after right click the application project folder then run as->launch on 
   hardware (GDB). If using the UART terminal see this step the below.
5. Set up a serial terminal with the settings:
	COM Port: Check device manager
	Board Rate: 9600
	Data Bits: 8
	Stop Bits: 1
	Parity: None
```

## Additional Comments

- The previous project to create a MicroBlaze processor with a UART core is found [here](https://github.com/JSCBLOG/Microblaze_Hello_World)
- To change the buad rate, this can be done by clicking on the on the USB UART ip core in the block design.
- Link to Writing Basic Software Application [here](https://github.com/JSCBLOG/MicroBlaze_GPIO/blob/master/Writing%20Basic%20Software%20Application.pdf)
- Ensure target language is set to VHDL (Settings->General->Target Language), otherwise when creating the IP, the template
  code will be in Verilog.
## Issues and Bugs

**SDK crashing:**<br/>
	Error: Vivado keeps crashing when trying to re-open exisiting IP,message: Plug-in org.eclipse.cdt.ui was unable to load 	            class org.eclipse.cdt.internal.ui.editor.CEditor. <br/>
	Fix: Open SDK from windows NOT Vivado and open it to the project .sdk folder.

## Built With

* [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) - The software used
* [Nexys-4 DDR](https://store.digilentinc.com/nexys-4-artix-7-fpga-trainer-board-limited-time-see-nexys4-ddr/) - The hardware used

## Website

[JSCBLOG](http://jscblog.com/)



