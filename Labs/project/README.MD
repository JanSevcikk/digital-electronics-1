# MORSE CODE TRANSMITTER and RECEIVER


### Team members

* Ivan Lipták [@240942](https://github.com/IvoSvk)(responsible for VHDL transmitter module and cooperation with receiver)
* Jan Ševčík [@xsevci71](https://github.com/JanSevcikk)(responsible for VHDL project github completation and documentation and transmitter module)
* Martin Monček [@240954](https://github.com/)(responsible for  VHDL receiver module and documentation fixes)

### Table of contents 

* [Theoretical description and explanation](#theo)
* [Goals](#goals)
* [Hardware description of demo application](#hardware)
* [Software description](#software)
* [Component(s) simulation](#component)
* [Instructions](#instruction)
* [References](#references)


<a name="theo"></a>

## Theoretical description and explanation 

This project shows how to complete assingment of creating Morse code transmitter and receiver which works correctly and is able to transmitr user chosen message and receive generated message. 
First objective is to choose button and switches which will be operate the device. We chosen way of using ASCII to binary code. On switches you chose value which is showed on 7seg display and is send by button. 

Receiveng part needs to accept message on port JA. Message is received by using edge detector, which chooses rising edge and chooses if tha value is 0 or 1. Then the code changed fro

<a name="goals"></a>

## GOALS of the work
The main goal of this project is to create a Morse Code Transmitter and Reciever. Project is made within subject Digital Electronics (2022/23). For project is used board Arty-A7-50T [ref](https://digilent.com/shop/arty-a7-100t-artix-7-fpga-development-board/). On this board is used buttons, switches and I/O ports and showing input and output on the 7-segment display. For coding is used IDE Vivado 2020.2.  

First part was to made transmitter. Signals are entered via switches, like in real-life morse code usage (like telegraphs) - on switches you choose value in ASCII code (binary) with 8 switches (8bit binary code) by switching switches whichc changes values from 0 to 1. Chosen value is showed on right 7-seg display unit. After value is chosen you can send Morse code by pushing left push button. LED 0 blinks red light when there is sendind procedure. And LED 1 blink the morse code which you are sending. 

Second part is receiver, which needs to receive standardized input send by other arduino device via. First you choose text which you wanna send in PuTTY on computer connected to Arduino which is connected to input port on Nexys A7. Mončekovo část......

Our goal is to create simple Morse transmitter and receiver with functions that shows state of working.

Using ASCII code 

### ASCII table to binary
<img src="images/ascii.png" alt="morse" style="width:450px;"/>

#### Morse alphabet

<img src="images/morse_alphabet.png" alt="morse" style="width:450px;"/>
    

#### 7-seg alphabet implementation

To display whole alphabet on 7-seg display we use 7-segment alphabet 'Seikoo' by Alexander Fakoó

<img src="images/7seg_alphabet.png" alt="morse" style="width:450px;"/>

<a name="hardware"></a>

## Hardware description of demo application
### Board - Nexys A7-50T
The Nexys A7 board is a complete, ready-to-use digital circuit development platform based on the latest Artix-7™ Field Programmable Gate Array (FPGA) from Xilinx®. With its large, high-capacity FPGA, generous external memories, and collection of USB, Ethernet, and other ports, the Nexys A7 can host designs ranging from introductory combinational circuits to powerful embedded processors. Several built-in peripherals, including an accelerometer, temperature sensor, MEMs digital microphone, a speaker amplifier, and several I/O devices allow the Nexys A7 to be used for a wide range of designs without needing any other components.

From board are used: Switches for chosing ASCII code and buttons to sending messages. There are also used LEDs for showing status (sending/receiveing) and second LED is used for blinking symbols (dots and lines).

Project is build for using two boards instead of one. One is used only for receiver and second one for transmitter.

### Buttons
Project uses two buttons. One for testing purposes - master reset, which resets all values to zero if the program happens to stuck in loop or another problem. Second (left) button is used to trancieve made text out.
<img src="images/buttons.png" alt="morse" style="width:450px;"/>

### Switches
Switches are used for changing ASCII code. Using 8bit table to ASCII. Switches are used to change values 0 and 1. Which is shoved on 7seg display.
<img src="images/switches.png" alt="morse" style="width:450px;"/>

### 7seg display 
Used for shoving receiver/trasmitting alphabets and numbers. Code is based on existing code hex_7seg from lessons with minor changes.

<img src="images/7seg.png" alt="morse" style="width:450px;"/>

### Diodes
In project in trasmitting part is used two LEDs, LED 0 for showing status of transmitting and LED 1 for blinking dots and lines (optional to looking)

<a name="software"></a>

## Software description

### Transmitter

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Receiver

<a name="component"></a>

### Component(s) simulation
### Transmitter

Write descriptive text and simulation screenshots of your components.
### Receiver

<a name="component"></a>

## Instructions and video

How to use Morse transmitter and receiver:
### 1. Transmitting part
Use bottom switches, to change ASCII values to made your desired value showed on 7seg display. XXXXXXXXXX

<img src="images/send.png" alt="morse" style="width:450px;"/>

### 2. Receiving part



<img src="images/receive.png" alt="morse" style="width:450px;"/>

[Video of working prototype](youtube.comaaaaa)

<a name="references"></a>

## References

1. [Board](https://digilent.com/reference/programmable-logic/nexys-a7/start)
2. [ASCII table](https://bournetocode.com/projects/GCSE_Computing_Fundamentals/pages/img/ascii_table_lge.png)
3. [display driver](https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/07-display_driver)
4. [Decoder design in VHDL](https://www.researchgate.net/publication/305379385_Morse_code_decoder_design_in_VHDL_using_FPGA_Spartan_3E_development_kit)