v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 70 -60 160 -60 { lab=#net1}
N 160 -60 160 -30 { lab=#net1}
N 160 -60 260 -60 { lab=#net1}
N 70 0 120 0 { lab=#net2}
N 160 -0 180 -0 { lab=#net1}
N 180 -60 180 -0 { lab=#net1}
N 260 -0 260 70 { lab=GND}
N 160 70 260 70 { lab=GND}
N 160 30 160 70 { lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 140 0 0 0 {name=M1
L=0.50
W=1
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} 70 -30 0 0 {name=Vgs value=1.8}
C {vsource.sym} 260 -30 0 0 {name=Vds value=0}
C {gnd.sym} 160 70 0 0 {name=l1 lab=GND}
C {code_shown.sym} -230 -160 0 0 {name=s1 only_toplevel=false value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"
}
C {code_shown.sym} -230 -90 0 0 {name=s2 only_toplevel=false value="
.dc Vds 0 2.2 1m
.save all
.end
"}
