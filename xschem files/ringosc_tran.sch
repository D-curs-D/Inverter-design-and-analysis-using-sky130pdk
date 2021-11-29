v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 350 -26 373 -26 { lab=vout}
N 173 -41 173 -25 { lab=VDD}
C {vsource.sym} 173 5 0 0 {name=V1 value=1.8v}
C {gnd.sym} 173 35 0 0 {name=l1 lab=GND}
C {gnd.sym} 230 36 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 373 -26 1 0 {name=l3 sig_type=std_logic lab=vout}
C {code_shown.sym} -95 -215 0 0 {name=s1 only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} -108 -138 0 0 {name=s2 only_toplevel=false value="
.include /home/harshit/.xschem/ringosc.spice
.tran 1ps 1s uic
.savecurrents
.save all
.end"}
C {lab_wire.sym} 173 -40 0 0 {name=l4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 256 -40 0 0 {name=l5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 256 -10 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 230 36 0 0 {name=l7 sig_type=std_logic lab=VSS}
C {/home/harshit/.xschem/ringosc.sym} 332 0 0 0 {name=x1}
