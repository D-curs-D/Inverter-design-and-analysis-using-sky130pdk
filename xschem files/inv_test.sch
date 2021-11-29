v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -20 60 -20 80 { lab=Vdd}
N 230 30 230 50 { lab=GND}
N 230 -44 230 -30 { lab=Vdd}
N 150 0 190 0 { lab=Vin}
N 284 0 304 0 { lab=Vout}
C {/home/harshit/.xschem/inv_1.sym} 260 0 0 0 {}
C {vsource.sym} -20 110 0 0 {name=Vdd value=1.8}
C {vsource.sym} 40 112 0 0 {name=Vin value="pulse(0 1.8 0 1ns 1ns 5ns 10ns)"}
C {gnd.sym} -20 140 0 0 {name=l1 lab=GND}
C {gnd.sym} 40 142 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -20 60 0 0 {name=l8 sig_type=std_logic lab=Vdd

}
C {code_shown.sym} -150 -130 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} -150 -80 0 0 {name=s2 only_toplevel=false value="
.dc Vin 0 1.8 1m
;.tran 100ps 20ns
.op
.save all
"}
C {lab_wire.sym} 230 -44 1 0 {name=l3 sig_type=std_logic lab=Vdd}
C {gnd.sym} 230 50 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 304 0 2 0 {name=l4 sig_type=std_logic lab=Vout
}
C {lab_pin.sym} 150 0 0 0 {name=l6 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 40 82 1 0 {name=l7 sig_type=std_logic lab=Vin}
