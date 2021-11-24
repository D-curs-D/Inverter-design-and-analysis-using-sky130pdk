v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 190 -60 190 -50 { lab=Vout}
N 190 -60 280 -60 { lab=Vout}
N 280 -60 280 10 { lab=Vout}
N 190 10 190 90 { lab=GND}
N 220 90 280 90 { lab=GND}
N 280 70 280 90 { lab=GND}
N 190 -20 220 -20 { lab=GND}
N 220 -20 220 90 { lab=GND}
N 190 -80 190 -60 { lab=Vout}
N 190 90 220 90 { lab=GND}
C {res.sym} 190 -110 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {sky130_fd_pr/nfet_01v8.sym} 170 -20 0 0 {name=M1
L=0.30
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} 240 90 0 0 {name=l1 lab=GND}
C {vsource.sym} -180 30 0 0 {name=V1 value=1.8}
C {vsource.sym} -130 30 0 0 {name=V2 value="pulse(0 1.8 0 500ps 500ps 4ns 10ns)"}
C {gnd.sym} -130 60 0 0 {name=l2 lab=GND}
C {gnd.sym} -180 60 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -180 0 0 0 {name=l4 sig_type=std_logic lab=Vdd
}
C {lab_wire.sym} -130 0 0 0 {name=l5 sig_type=std_logic lab=Vin
}
C {lab_wire.sym} 150 -20 0 0 {name=l6 sig_type=std_logic lab=Vin
}
C {lab_wire.sym} 190 -140 0 0 {name=l7 sig_type=std_logic lab=Vdd
}
C {devices/capa.sym} 280 40 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} -250 -210 0 0 {name=s1 only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
"}
C {devices/code_shown.sym} -250 -130 0 0 {name=s2 only_toplevel=false value="
.tran 100ps 12ns
.save all
.end
"}
C {lab_wire.sym} 280 -60 2 0 {name=l8 sig_type=std_logic lab=Vout}
