v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 216 -134 216 -108 { lab=Vdd}
N 216 -78 226 -78 { lab=Vdd}
N 226 -126 226 -78 { lab=Vdd}
N 216 -126 226 -126 { lab=Vdd}
N 216 -48 216 -2 { lab=Vout}
N 302 -26 302 2 { lab=Vout}
N 216 -26 302 -26 { lab=Vout}
C {gnd.sym} 216 58 0 0 {name=l1 lab=GND}
C {vsource.sym} -180 30 0 0 {name=V1 value=1.8}
C {vsource.sym} -130 30 0 0 {name=V2 value="pulse(0 1.8 0 500ps 500ps 4ns 10ns)"}
C {gnd.sym} -130 60 0 0 {name=l2 lab=GND}
C {gnd.sym} -180 60 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -180 0 0 0 {name=l4 sig_type=std_logic lab=Vdd
}
C {lab_wire.sym} -130 0 0 0 {name=l5 sig_type=std_logic lab=Vin
}
C {lab_wire.sym} 176 -78 0 0 {name=l6 sig_type=std_logic lab=Vin
}
C {lab_wire.sym} 216 -134 0 0 {name=l7 sig_type=std_logic lab=Vdd
}
C {devices/code_shown.sym} -250 -210 0 0 {name=s1 only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
"}
C {devices/code_shown.sym} -250 -130 0 0 {name=s2 only_toplevel=false value="
.tran 100ps 12ns
.save all
.end
"}
C {lab_wire.sym} 302 -26 0 0 {name=l8 sig_type=std_logic lab=Vout}
C {sky130_fd_pr/pfet_01v8.sym} 196 -78 0 0 {name=M1
L=0.30
W=4
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {res.sym} 216 28 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 302 32 0 0 {name=C2
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 302 62 0 0 {name=l9 lab=GND}
