v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -46 98 -46 118 { lab=Vin}
N -102 98 -102 118 { lab=Vdd}
N 188 20 208 20 { lab=Vin}
N 248 -28 248 -10 { lab=Vdd}
N 302 20 328 20 { lab=Vout}
N 328 20 378 20 { lab=Vout}
N 347 20 347 35 { lab=Vout}
C {vsource.sym} -46 148 0 0 {name=Vin value="pulse(0 1.8 0 1ns 1ns 4ns 10ns)"}
C {vsource.sym} -102 148 0 0 {name=Vdd value=1.8}
C {gnd.sym} -46 178 0 0 {name=l1 lab=GND}
C {gnd.sym} -102 178 0 0 {name=l2 lab=GND}
C {gnd.sym} 248 50 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -46 98 1 0 {name=l4 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -102 98 1 0 {name=l5 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 248 -28 0 0 {name=l6 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 188 20 0 0 {name=l7 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 378 20 1 0 {name=l8 sig_type=std_logic lab=Vout}
C {capa.sym} 347 65 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 347 95 0 0 {name=l9 lab=GND}
C {code.sym} -80 -90 0 0 {name=SPICE_cmds only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
* .include /home/harshit/.xschem/inv.spice
.tran 100ps 20ns
.dc Vin 0 1.8 1m 
.save all
* .let curr = "@m.x1.xm1.msky130_fd_pr__nfet_01v8[id]"
.save i(c1)
* .func foo(v(vout)) \{abs(deriv(v(vout))) >= 1\}
.options savecurrents
.end"}
C {/home/harshit/.xschem/inv_1.sym} 278 20 0 0 {name=x1}
