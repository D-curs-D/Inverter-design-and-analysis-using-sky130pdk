v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 140 30 140 50 { lab=#net1}
N 140 50 248 50 {lab=#net1}
N 248 30 248 50 { lab=#net1}
N 140 -44 140 -30 { lab=#net2}
N 140 -44 247 -44 {lab=#net2}
N 247 -44 248 -44 { lab=#net2}
N 248 -44 248 -30 { lab=#net2}
N 194 -0 210 0 { lab=#net3}
N 60 -0 100 -0 { lab=xxx}
N 300 -0 320 0 { lab=Vout}
C {/home/harshit/.xschem/inv_1.sym} 170 0 0 0 {}
C {/home/harshit/.xschem/inv_1.sym} 278 0 0 0 {name=x2}
C {ipin.sym} 60 0 0 0 {name=p1 lab=Vin}
C {iopin.sym} 190 -40 3 0 {name=p2 lab=Vdd
}
C {iopin.sym} 190 45 1 0 {name=p3 lab=Vss}
C {opin.sym} 320 0 0 0 {name=p4 lab=Vout}
