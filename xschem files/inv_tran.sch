v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -86 38 -86 58 { lab=Vin}
N -142 38 -142 58 { lab=Vdd}
N 168 0 188 0 { lab=Vin}
N 228 -48 228 -30 { lab=Vdd}
N 282 0 308 0 { lab=Vout}
C {vsource.sym} -86 88 0 0 {name=Vin value="pulse(0 1.8 0 1ns 1ns 4ns 10ns)"}
C {vsource.sym} -142 88 0 0 {name=Vdd value=1.8}
C {gnd.sym} -86 118 0 0 {name=l1 lab=GND}
C {gnd.sym} -142 118 0 0 {name=l2 lab=GND}
C {gnd.sym} 228 30 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -86 38 1 0 {name=l4 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -142 38 1 0 {name=l5 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 228 -48 0 0 {name=l6 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 168 0 0 0 {name=l7 sig_type=std_logic lab=Vin}
C {code_shown.sym} -154 -168 0 0 {name=s1 only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} -154 -98 0 0 {name=s2 only_toplevel=false value="
.include /home/harshit/.xschem/inv.spice
.tran 100ps 20ns
.save all
.end"}
C {/home/harshit/.xschem/inv_1.sym} 258 0 0 0 {name=x1}
C {lab_wire.sym} 308 0 1 0 {name=l8 sig_type=std_logic lab=Vout}
