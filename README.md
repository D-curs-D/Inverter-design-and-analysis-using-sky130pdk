# Inverter-design-and-analysis-using-sky130pdk
### Design and Analysis of CMOS Inverter using the sky130 pdk and various open source tools
---
This project has only one motive; that is to experiment with working of an inverter and understanding all the parameters involved with it. The design will utilise the models that are present under the __skywater 130nm pdk__ and various open source tools such as, __Xschem__, __NGSPICE__, __MAGIC__, __Netgen__, etc.

The whole process starts with analysis of _NMOS_ and _PMOS_ devices, specifically the 1.8v standard models available inside the pdk to determine a common working W/L ratio and also the gm, ron and similar values. After this we start with the design of a CMOS inverter that includes schematic, measurement of various parameters like delays, noise margin, risetime, falltime, etc. This part would also act as a case study on __SPICE__ where we use it's programming capabilities to better our abilities in measurements of aforementioned parameters. Then we will engage in the design a layout for our inverter in __magic layout editor__. Here, we will also explore the different layers available to the user and how we utilise them in a design and what it translates to in terms of a mask. Lastly, we compare the two netlists, that is the schematic and the layout one, which is popularly referred to as ___LVS___. If everything is hunky-dory, this project would then conclude. 

I will try to keep updating it as often as possible, as this first project is a primary resource for me to practice analog design, with the open source toolchain and definitely to keep a documentation that is easily understandable by anyone who later tries to practice it the same way.

Let's get right into it. 

![Inverter Design and Analysis](./Images/inverter_intro_picture.png)

---

## Contents
- [1. Tool and PDK Setup](#1-Tools-and-PDK-setup)
  - [1.1 Tools Setup](#11-Tools-setup)
  - [1.2 PDK Setup](#12-PDK-setup)
- [2. Analysis of MOSFET models](#2-Analysis-of-MOSFET-models)
  - [2.1 General MOS analysis](#21-General-MOS-analysis)
  - [2.2 Strong 0 and Weak 1](#22-Strong-0-and-Weak-1)
  - [2.3 Weak 0 and Strong 1](#23-Weak-0-and-Strong-1)
- [3. CMOS Inverter Design and Analysis](#3-CMOS-Inverter-Design-and-Analysis)
  - [3.1 Why CMOS Circuits](#31-Why-CMOS-Circuits) 
  - [3.2 CMOS Inverter Analysis(Pre-Layout)](#32-CMOS-Inverter-Analysis-Pre-Layout)
    - [3.2.1 DC Analysis and Important design parameters](#321-DC-Analysis-and-Important-design-parameters)
    - [3.2.2 DC Parametric Analysis](322-DC-Parametric-Analysis)

###### Section 1 has been referenced from [VSDOPEN21_BGR Readme file](https://github.com/D-curs-D/vsdopen2021_bgr/edit/main/README.md) Thanks [Kunal](https://github.com/kunalg123)!

## 1. Tools and PDK setup

### 1.1 Tools setup
For the design and simulation of our Inverter.
- Spice netlist simulation - [Ngspice](http://ngspice.sourceforge.net/)
- Layout Design and DRC - [Magic](http://opencircuitdesign.com/magic/)
- LVS - [Netgen](http://opencircuitdesign.com/netgen/)
- Schematic Capture - [Xschem](http://repo.hu/projects/xschem/)

#### 1.1.1 Ngspice 
![image](https://user-images.githubusercontent.com/49194847/138070431-d95ce371-db3b-43a1-8dbe-fa85bff53625.png)

[Ngspice](http://ngspice.sourceforge.net/devel.html) is the open source spice simulator for electric and electronic circuits. Ngspice is an open project, there is no closed group of developers.

[Ngspice Reference Manual](http://ngspice.sourceforge.net/docs/ngspice-manual.pdf): Complete reference manual in HTML format.

**Steps to install Ngspice** - <br>
___Don't use the version that comes with linux distribution, since it is dated and sometimes misses crucial updates___

_Follow the instructions in ngspice manual chapter 32, under section 32.1.2_

#### 1.1.2 Magic
![image](https://user-images.githubusercontent.com/49194847/138071384-a2c83ba4-3f9c-431a-98da-72dc2bba38e7.png)

 [Magic](http://opencircuitdesign.com/magic/) is a VLSI layout tool.
 
**Steps to install Magic** - 
 Open the terminal and type the following to install Magic
```
$  wget http://opencircuitdesign.com/magic/archive/magic-8.3.32.tgz
$  tar xvfz magic-8.3.32.tgz
$  cd magic-8.3.28
$  ./configure
$  sudo make
$  sudo make install
```
#### 1.1.3 Netgen
![image](https://user-images.githubusercontent.com/49194847/138073573-a819cc67-7643-4ecf-983d-454d99ec5443.png)

[Netgen](http://opencircuitdesign.com/netgen/) is a tool for comparing netlists, a process known as LVS, which stands for "Layout vs. Schematic". This is an important step in the integrated circuit design flow, ensuring that the geometry that has been laid out matches the expected circuit.

**Steps to install Netgen** - Open the terminal and type the following to insatll Netgen.
```
$  git clone git://opencircuitdesign.com/netgen
$  cd netgen
$  ./configure
$  sudo make
$  sudo make install 
```
#### 1.1.4 Xschem
![image](https://user-images.githubusercontent.com/43693407/143311382-8cd3c1c9-dd07-4179-892d-52e9cf71e5a7.png)

[Xschem](http://repo.hu/projects/xschem/xschem_man/xschem_man.html) is a schematic capture program that allows to interactively enter an electronic circuit using a graphical and easy to use interface. When the schematic has been created a circuit netlist can be generated for simulation.

**Steps to install Xschem**
Follow the instructions given [here](http://repo.hu/projects/xschem/xschem_man/tutorial_install_xschem.html) or follow [this](https://www.youtube.com/watch?v=jXmmxO8WG8s) video tutorial by the creator himself

### 1.2 PDK setup

A process design kit (PDK) is a set of files used within the semiconductor industry to model a fabrication process for the design tools used to design an integrated circuit. The PDK is created by the foundry defining a certain technology variation for their processes. It is then passed to their customers to use in the design process.

The PDK we are going to use for this BGR is Google Skywater-130 (130 nm) PDK.
![image](https://user-images.githubusercontent.com/49194847/138075630-d1bdacac-d37b-45d3-88b5-80f118af37cd.png)

**Steps to download PDK** - Open the terminal and type the following to download sky130 PDK.
```
$  git clone https://github.com/RTimothyEdwards/open_pdks.git
$  cd open_pdks
$  ./configure [options]
$  make
$  [sudo] make install
```

*or you can also use the instructions given at [open_pdk installation](http://opencircuitdesign.com/open_pdks/index.html), and also for all the other applications used here can be found at [Open Circuit Design](opencircuitdesign.com/) website. The website covers details about a lot of opensource tools, with details about their usage installation etc.*

---

## 2. Analysis of MOSFET models

### 2.1 General MOS Analysis

In this section I start with our analysis of MOSFET models present in sky130 pdk. I would be using the 1.8v transistor models, but you can definitely use and experiment with other ones present there. below is the schematic I created in **Xschem**.

___highly recommended to check out the tutorials of xschem [here](http://repo.hu/projects/xschem/xschem_man/xschem_man.html) and ngspice [here](http://ngspice.sourceforge.net/docs/ngspice-manual.pdf)___

![NMOS CHAR SCHEMATIC](./Images/nfet_for_vgs_vs_ids.png)

The components used are:<br>
```nfet_01v8.sym``` - from xschem_sky130 library<br>
```vsource.sym``` - from xschem devices library<br>
```code_shown.sym``` - from xschem devices library<br>

I used the above to plot the basic characteristic plots for an NMOS Transistor, That is ___Ids vs Vds___ and ___Ids vs Vgs___. To do that, just save the above circuit with the above mentioned specifications and component placement. After this just hit __Netlist__ then __Simulate__. ___ngspice___ would pop up and start doing the simulation based calculations. It will take time as all the libraries need to be called and attached to the simulation spice engine. Once that is done, you need to write a couple commands in the ngspice terminal:<br><br>
```display``` - This would display all the vectors available for plotting and printing.<br>
```setplot``` - This would list all the set of plots available for this simulation.<br>
_after this choose a plot by typing '''setplot <plot_name>'''. for example '''setplot tran1'''_<br>
```plot``` - to choose the vector to plot.<br>
_example : plot -vds#branch_<br><br>

Then you must see the plot below you, if you did a DC sweep on the __VGS__ source for different values of __VDS__:<br>
![Ids vs Vgs](./Images/nfet_Ids_vs_Vgs.png)<br><br>

This definitely shows us that the threshold value is between __600mV to 700mV__ and I think I will be using ___650mV___ for my future calculations.
Similarly, when I sweep __VDS__ source for different values of __VGS__, I get the below plot:<br>

![Ids vs Vds](./Images/nfet_Ids_vs_Vds.png)<br><br>

Now the above two definitely looks like what the characteristics curves should, but now we need to choose a particular curve that we would do further analysis on.

I also did plot gm and go(or ro) values for the above mosfet. This would be crucial as we can obtain a lot of parameters from these values. Both of these below are for the general dc sweep we did above. 
![gm](./Images/nfet_gds.png)<br>
![go](./Images/nfet_go.png)<br>

Since I am making an inverter, let's choose the highest value avialable for the Vds, that is __1.8V__. So to do that, we just change the value of Vds source to 1.8 and then hit netlist, then simulate to simulate the circuit.<br>
![Ids vs Vgs for Vds = 1.8](./Images/nfet_ids_vs_Vgs_Vds18.png)

This above plot also tells us the value of current at this value of __Vgs__ which is around __320uA__. Next step is to calculate the __Gm__, that is the transconductance parameter. To do that we simple type the commands as shown in the console in the left hand side. The ```deriv()``` function takes the derivative with respect to the independent variable present at the current simulation. From the definition of __Gm__ we are aware that it is ___dIds/dVds___. Hence, I did the same to plot the __Gm__ of this nfet. After this I measured the value at 1.8V.<br>
___Information on how to use the meas command can be found at [ngspice manual](http://ngspice.sourceforge.net/docs/ngspice-manual.pdf) !___ <br><br>
![Gm for nfet_1v8](./Images/nfet_Gm_at_Vds018.png)

Similaraly I did the same for ___Ids vs Vds___ and also used that to find ___rds___
![Vds plot](./Images/nfet_ids_vs_Vds_Vgs18.png)
![Rds plot](./Images/nfet_rds_Vgs18.png)<br><br>

Hence, we now have all our important values we needed. Same can be done for a ___PMOS___. Motive is same, but expecially to extract the value of Aspect ratio for which the current is the same in both NMOS and PMOS. I have done some experimentation and found that at __W/L of PMOS__ = __4 * (Aspect ratio of NMOS)__, the current value is pretty close. So, we found the NMOS had a current of __317 microamps__ while PMOS has the current of __322 microamps__ (both at |Vgs| = 1.8V). SO like 5 microamps apart. (NOT BAD!!) <br><br>
![pfet test bench](./Images/pfet_test_ckt.png)<br>
![Vds vs Ids for pfet](./Images/pfet_Ids_vs_Vds_for_Vsg018.png)<br><br>
___The last one might be the most important one for an Inverter design___<br><br>


### 2.2 Strong 0 and Weak 1
What does the above mean? Look at the graph below,<br><br>
![NMOS as inverter](./Images/nmos_as_inverter.png)<br>
![NMOS weak Zero](./Images/nmos_tran_inverter.png)<br><br>


You can see that, when a square wave is applied to the input of NMOS, when it is __LOW(0V)__, the output goes to __HIGH(1.8V)__. But when the input is __HIGH(1.8V)__, the output goes to a value that is much larger than 0V. This is due to the fact that when Vgs is 1.8V, the NMOS is in linear region. This is where the MOSFET acts as a voltage controlled resistor. At this point, the output is connected to a Voltage Divider Configuration. That is the output takes the value which is defined by the voltage across the resistance of the mosfet. Hence, ___NMOS is able to transmit STRONG 0, but not a STRONG 1. So NMOS is Strong 0 but a Weak 1___<br><br>

### 2.3 Weak 0 and Strong 1
Again, some plots will clear the idea<br><br>
![PMOS as inverter](./Images/pmos_as_inverter.png)<br>
![PMOS weak One](./Images/pmos_tran_inverter.png)<br><br>

The reasoning is the same as the previous section<br><br>

___Hence, neither NMOS nor PMOS would make a great inverter on their own. So a plethora of configurations were taken into account, but at the last, only one stands as the most popular format of circuit design using mosfets. It is referred to as a CMOS configuration___

---

## 3. CMOS Inverter Design and Analysis
### 3.1 Why CMOS Circuits

An interesting obseration was made in the previous section, where we realised that neither NMOS nor PMOS can be used for design that can produce either values, HIGH and LOW. But another thing that is worth notice is how they complement each other. This is what gave rise to an idea of attaching them together. Since, __PMOS__ is a __Strong 1__, we put it between VDD and Vout and __NMOS__ being a __STRONG 0__, it is placed between Vout and GND. This way, either can act as a load to the other transistor, since __both are never ON together__ (Are they?). The configuration looks like what we have below. This is referred to as __Complimentary Metal Oxide Semiconductor__(CMOS) Configuration and it also represents the simplest circuit known as the __CMOS Inverter__.<br><br>
![CMOS Inverter](./Images/CMOS_Inverter_Schematic.png)<br>

CMOS Circuits generally consists of a network split into two parts, Upper one referred to as a __pull up network__ and the lower half as a __pull down network__. The former consists of P-channel MOSFETs and later N-Channel MOSFETs. Reason is simple. As one transistor is one, another is off. This eliminates the issue of an resistive path to the ground and hence, no voltage division occurs(At least not a significant one). This way, one can easily achieve a Strong High and a Strong LOW from the same network. __PULL UP__ is what offers a low resistance path to the VDD and __PULL DOWN__ is what offers a low resistance path the GND.

![pun_pdn](https://user-images.githubusercontent.com/43693407/143431624-72bece76-3d5a-41fd-bca7-d21beaecd977.gif)<br>

### 3.2 CMOS Inverter Analysis Pre-Layout

Before, I start with the CMOS inverter,  I believe it is worth mentioning what an Inverter is. Inverter is something that inverts. In electronics it is very popularly explained as something that performs the __NOT__ logic, that is complements the input. So a __HIGH(1.8V)__ becomes __LOW(0V)__ and vice versa. Ideally, the output follows the input and there is no delay or propogation issues of the circuit. But in reality, an inverter can be a real piece of work. It can have serveral isseus like how fast can it react to the changes in the input, how much load can it tolerate before it's output breaks and so many more including noise, bandwidth, etc.

All these parameters are what will always plague any analog design or design with transistor in general. Hence, with inverter many like to explore them all. So it justifies why Inverter is referred to as ___Hello World! of transistor level design___. Atleast, I say that :rofl:. So in this section that took me aeons to reach to, we finally start with all the important analysis and parameters to be evaluated for an Inverter. I first start with a schematic diagram, then I evaluate all the parameters, that is, measuring them, experimentin with them and reaching a conclusive value and Finally reach a schematic circuit that is capable of things we lay down at the beginning.

So I designed a Schematic of the Inverter, where the whole thing is based on what we determined earlier. I have chosen __(W/L) of PMOS = 4 times (W/L) of NMOS__ and __(W/L) of NMOS is 1/0.30 in microns__. I also designed a symbol of it, so that we can utilise that for further schematic creation.<br><br>
![cmos_inverter_schematic](./Images/CMOS_inv_sch_and_sym.png)<br>

A lot of calculations will now start from this point. Similar to how we analysed for MOSFETs individually. Also from now on, ___(W/L)___ would be mentioned as ___S___ or ___Aspect Ratio___ Simply. We would use the following testbecnch for future analysis.(Transient and DC)<br>
![cmos_inv_tb](./Images/cmos_inv_tb.png)<br>

#### 3.2.1 DC Analysis and Important design parameters

DC analysis would be used to plot a Voltage Transfer Characteristics (VTC) curve for the circuit. It will sweep the value of Vin from high to low to determine the  working of circuit with respect to different voltage levels in the input. The following plot is observed when simulated :<br>
![cmos inverter vtc](./Images/cmos_inv_dc_anal.png)

A voltage transfer characteristics paints a plot that shows the behavior of a device when it's input is changed(full swing). It shows what happens to the output as input changes. In our case, for an inverter we can see a plot that is like a square wave(non ideal), that changes it's nature around 0.75 volts of input. So one can say that there are like 3 regions in the VTC curve, the portion where output is high, the place of transistion and the one where the output goes low. But actually there are __five regions of operation__ and they are based on the working of inverter constituents, that is the NMOS and the PMOS transistors with respect to the change in the input potential. <br>
![inverter-operating-regions](https://user-images.githubusercontent.com/43693407/143764318-d0893545-f47c-44b8-a27c-8de8bc4f0759.jpg)

One can solve for them using the equations for individual transistors. Now it is time to talk about the important parameters of this device that are based off it's VTC curve.
- __VOH__ - Maximum output voltage when it is logic _'1'_.
- __VOL__ - Minimun output voltage when it is logic _'0'_.
- __VIH__ - Maximum input voltage that can be interpreted as logic _'0'_.
- __VIL__ - Minimum input voltage that can be interpreted as logic _'1'_.
- __Vth__ - Inverter Threshold voltage

Above five are critical for an Inverter and can be seen on the __VTC__ curve of an inverter. One thing to point out now would be,
<p align=center><i><b>Vth should be at a value of VDD/2 for maximum noise margins</b></i></p> 

And I tried to do that with our calculated inverter values at __l=300nm__ but guess what! It did not work at all. I know there has to be a reason for it, which I will try to investigate further, but as of now, I changed the device parameters to get __Vth__ close to the values __Vdd/2__. Now our __NMOS has S = 1.05/0.15__ and __PMOS has S = 2.1/0.15__. Below is it's simulation result using the same testbench.<br>
![cmos_inv_vtc_150](./Images/cmos_inv_vtc_150.png)<br><br>

__VOH__ and __VOL__ are easy to determine as they are your aboslute values. In our case it is __1.8V__ and __0V__ respectively. For __Vih__ and __Vil__, we have another method. At __Vin__ = __VIH__, NMOS is in Saturation region and PMOS in Linear; while when __Vin__ = __VIL__, NMOS is in Linear and PMOS in Saturation. Another interesting thing about these points is that, _these are the points on the curve, when the magnitude of slope = 1_. So we can use ```measure``` commands to find them on the plot. In the plot shown below, look at the points that are at the intersection of the vout curve and the blue vertical line. These are our __VIH__ and __VIL__.<br>
![cmos_inv_vih_vil_plot](./Images/cmos_inv_vih_vil_plot.png)<br><br>

And to calculate them, we use ```.meas``` statement with apt instructions. The result is down below.<br>
![cmos_inv_vih_vil_val](./Images/cmos_inv_vih_vil_val.png)<br><br>

Look at the commands used carefully. The first lines declares a function, that I have used to see at what region is the derivative of Vout with respect to Vin greater than or equal to one. This has no significance other than visualizing what region is the one where transition occurs. After this I set the plot to dc1, which is the identifier for the first dc analysis done for the netlist. Then it was just plotting them all and using the measure statements to determine the values necessary.

Let's summarize the values obtained :
| Voltage | Value |
|---------|-------|
| Vth_inv | 0.87V |
|   VOH   | 1.8V  |
|   VOL   |  0V   |
|   VIH   | 0.98V |
|   VIL   | 0.74V |

Now all the basic defining characteristics of an inverter are done. So we can find a couple more things and then proceed towards the transient analysis. Next is __Noise Margins__. Noise margins are defined as the range of values for which the device can work noise free or with high resistance to noise. This is an important parameter for digital circuits, since they work with a set of specific values(2 for binary systems), so it becomes crucial to know what values of the voltages can it sustain for each value. This range is also referred to as __Noise Immunity__. There are two such values of Noise margins for a binary system:<br>
<b>NML(Noise Margin for Low) - VIL - VOL</b><br>
<b>NMH(Noise Margin for HIGH) - VOH - VIH</b><br>

So for our calculated values, the device would have, __NML = 0.74V__ and __NML = 0.82V__.

Now, they aren't equal. But if we were to take some more effort to get the values of Vth closet to Vdd/2 (0.9V), then we can get NML = NMH. But for our case they are close enough. Then a last parameter that is crucial for any design is the power it consumes. The __Power Dissipation__ of our inverter is given by __P = Vout * Id__, where Id is the drain current. I think I have not added a plot of the drain current yet. So let's do that below and calculate the power consumption of our inverter.<br>
![cmos_inv_curr_plot](./Images/cmos_inv_curr_plot.png)<br>
![cmos_inv_pdiss](./Images/cmos_inv_pdiss.png)<br><br>

Hence, the total __Power Dissipation = 5.55u Watts__ for our device. Also, notice how current only spikes up when the transistion occurs. This region is referred to as __transition region__ and it's width is given by __(VIH - VIL) = 0.24V__. So there is almost __0 watts of power consumed!!!__ when the device is at __VOH__ or __VOL__, that is power only consumed when switching between states.


#### 3.2.2 DC Parametric Analysis
Now, let's analyse the inverter with variations in it's design parameters, like __Width(W)__, __VDD__ and __Cload__. To write a parametric sweep, we have to write a script inside our netlist. Let's proceed.

__(A) Width(W) variations__<br>
I have added the following script inside the spice netlist for out inv_testbench. 
