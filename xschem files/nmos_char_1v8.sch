v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 130 30 130 80 { lab=GND}
N 50 -0 50 20 { lab=#net1}
N 50 -0 90 0 { lab=#net1}
N 130 -50 130 -30 { lab=#net2}
N 130 -50 240 -50 { lab=#net2}
N 240 -50 240 20 { lab=#net2}
N 130 -0 150 -0 { lab=GND}
N 150 -0 150 50 { lab=GND}
N 130 50 150 50 { lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 110 0 0 0 {name=M1
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
C {vsource.sym} 50 50 0 0 {name=Vgs value=1.8
}
C {vsource.sym} 240 50 0 0 {name=Vds value=0
}
C {gnd.sym} 50 80 0 0 {name=l1 lab=GND}
C {gnd.sym} 240 80 0 0 {name=l2 lab=GND}
C {gnd.sym} 130 80 0 0 {name=l3 lab=GND}
C {code_shown.sym} -190 -160 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {code_shown.sym} -190 -90 0 0 {name=s2 only_toplevel=false value="
.dc Vds 0 2.2 1m
.save all
.end
"}
