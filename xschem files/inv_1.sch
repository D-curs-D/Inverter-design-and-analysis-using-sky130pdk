v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 150 10 150 50 { lab=Vout}
N 110 -20 110 80 { lab=Vin}
N 150 -70 150 -50 { lab=Vdd}
N 150 -60 170 -60 { lab=Vdd}
N 170 -60 170 -20 { lab=Vdd}
N 150 -20 170 -20 { lab=Vdd}
N 150 110 150 130 { lab=VSS}
N 150 80 170 80 { lab=VSS}
N 170 80 170 120 { lab=VSS}
N 150 120 170 120 { lab=VSS}
N 100 30 110 30 { lab=Vin}
N 150 30 160 30 { lab=Vout}
C {sky130_fd_pr/nfet_01v8.sym} 130 80 0 0 {name=M1
L=0.15
W=1.05
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
C {ipin.sym} 150 -70 0 0 {name=p3 lab=Vdd
}
C {ipin.sym} 150 130 0 0 {name=p4 lab=VSS
}
C {opin.sym} 160 30 0 0 {name=p2 lab=Vout}
C {ipin.sym} 100 30 0 0 {name=p1 lab=Vin}
C {sky130_fd_pr/pfet_01v8.sym} 130 -20 0 0 {name=M2
L=0.15
W=2.1
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
