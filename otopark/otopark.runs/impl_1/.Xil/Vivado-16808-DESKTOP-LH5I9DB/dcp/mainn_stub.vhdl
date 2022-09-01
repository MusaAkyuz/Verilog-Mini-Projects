-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mainn is
  Port ( 
    girissensor : in STD_LOGIC;
    bariyersensor : in STD_LOGIC;
    kirmiziled : out STD_LOGIC;
    yesilled : out STD_LOGIC;
    bariyer : out STD_LOGIC;
    aracsayisi : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end mainn;

architecture stub of mainn is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
