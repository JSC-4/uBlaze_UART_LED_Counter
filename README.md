# MicroBlaze LED Counter using UART with Nexys-4 DDR

This project is about using the Nexys-4 DDR, to create a MicroBlaze SoC and communicating with the UART. A Custom IP of an LED
Counter was created, whcih is then controlled by the UART core, running on the MicroBlaze processor. 

### Prerequisites

* MicroBlaze compatible FPGA board
* Vivado with license

## Getting Started

### Vivado

```
1. Create a new project. As no RTL sources are not used "Do not specify sources at this time" can be checked.
   Select the FPGA board used and finish building the project.
2. To make a new IP, go to tool->Create and Package New IP. Pick "Create Axi4 Preipheral", change name of IP to LED_Controller
   (other details on the Peripheral Details window can be changed). On the last page, click "Edit IP" and click finish.
3. Click "Add Sources"->"Add or Create Design Sources"->Add Files and add the VHDL file found in the additional comments. [LED_Counter](www.google.com).
4. In the LED_Controller_v1_0_S00_AXI_inst file, add a 16-bit output called LED (same as VHDL file) to the ports. Instansiate the
   VHDL code, by adding the component to the Architecture and Port Map the code. m_clk to to S_AXI_ACLK, reset to S_AXI_ARESETN,
   sw to slv_reg0(1 downto 0) and LED to LED.
5. In the LED_v1_0(arch_imp file, add the same LED signal to the ports at the top of the page. Add the LED signal to the component
   declaration and to the instantiation.
6. Click on the Package IP window and merge any changes in files without tick marks (File Groups, Customisation Parameter etc). After
   this click on the Review and Package IP step->Edit Packaging Settings. In the After Packaging section, tick the first three boxes.
   Lastly click on Package IP.
7. Once back in the orignal project, create a clock design with a MicroBlaze Processor and UART core, which is the same as 
   the Hello World Project (check additional comments). Add the new LED_Controller IP, right click the LED[15:0] port and click make
   external.
8. Create a HDL Wrapper of the project and click Open Elaborated Design. In the top right drop down box, click floorplanning, change
   the LED ports voltage to LVCMOS3V3 and map the FPGA LEDs to the correct ports.
9. Run connection automation, validate the design, create a HDL wrapper (if not already created) and generate bitstream.
10. Once bitstream is generated, go to file->export->export hardware and make sure INCLUDE BITSTREAM is checked.
11. File->Launch SDK
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
- When connecting the custom IP to the S_AXI_ARESETN signal, make sure any VHDL files, use active low reset (i.e. 0) and not active
  high, otherwise the code will be stuck in a reset state.
- If there is external IPs, these can be added to the project repository by clicking Settings->IP->Repository then adding the location.
## Issues and Bugs

**DCP Error:**<br/>
	Error: DCP does not exist error, when trying to open Elaborated Design. <br/>
	Fix: Check the rest of the errors, as mismatch in spellings or names can cause this.

## Built With

* [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) - The software used
* [Nexys-4 DDR](https://store.digilentinc.com/nexys-4-artix-7-fpga-trainer-board-limited-time-see-nexys4-ddr/) - The hardware used

## Website

[JSCBLOG](http://jscblog.com/)



