entity inv_1 is
port(
  Vout : out std_logic ;
  Vdd :  in std_logic ;
  VSS :  in std_logic ;
  Vin :  in std_logic
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

