entity inv_test is
end inv_test ;

architecture arch_inv_test of inv_test is

component inv_1 
port (
  Vdd : in std_logic ;
  Vout : out std_logic ;
  Vin : in std_logic ;
  VSS : in std_logic
);
end component ;


signal Vdd : std_logic ;
signal GND : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
begin
x2 : inv_1
port map (
   Vdd => Vdd ,
   Vout => net1 ,
   Vin => net2 ,
   VSS => GND
);

V1 : vsource
generic map (
   value => 1.8
)
port map (
   p => Vdd ,
   m => GND
);

V2 : vsource
generic map (
   value => pulse(0 1.8 0 1ns 1ns 5ns 10ns)
)
port map (
   p => net3 ,
   m => GND
);

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.tran 100ps 20ns
.op
.save all

end arch_inv_test ;


-- expanding   symbol:  /home/harshit/.xschem/inv_1.sym # of pins=4
-- sym_path: /home/harshit/.xschem/inv_1.sym
-- sch_path: /home/harshit/.xschem/inv_1.sch
entity inv_1 is
port (
  Vdd : in std_logic ;
  Vout : out std_logic ;
  Vin : in std_logic ;
  VSS : in std_logic
);
end inv_1 ;

architecture arch_inv_1 of inv_1 is

begin
M1 : nfet_01v8
generic map (
   L => 0.15 ,
   W => 0.5 ,
   nf => 1 ,
   mult => 1 ,
   ad => 'int((nf+1)/2) * W/nf * 0.29' ,
   pd => '2*int((nf+1)/2) * (W/nf + 0.29)' ,
   as => 'int((nf+2)/2) * W/nf * 0.29' ,
   ps => '2*int((nf+2)/2) * (W/nf + 0.29)' ,
   nrd => '0.29 / W' ,
   nrs => '0.29 / W' ,
   sa => 0 ,
   sb => 0 ,
   sd => 0 ,
   model => nfet_01v8 ,
   spiceprefix => X
)
port map (
   D => Vout ,
   G => Vin ,
   S => VSS ,
   B => VSS
);

M2 : pfet_01v8
generic map (
   L => 0.15 ,
   W => 1.5 ,
   nf => 1 ,
   mult => 1 ,
   ad => 'int((nf+1)/2) * W/nf * 0.29' ,
   pd => '2*int((nf+1)/2) * (W/nf + 0.29)' ,
   as => 'int((nf+2)/2) * W/nf * 0.29' ,
   ps => '2*int((nf+2)/2) * (W/nf + 0.29)' ,
   nrd => '0.29 / W' ,
   nrs => '0.29 / W' ,
   sa => 0 ,
   sb => 0 ,
   sd => 0 ,
   model => pfet_01v8 ,
   spiceprefix => X
)
port map (
   D => Vout ,
   G => Vin ,
   S => Vdd ,
   B => Vdd
);

end arch_inv_1 ;

