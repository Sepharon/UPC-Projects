-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/26/2014 20:03:53"
                                                            
-- Vhdl Test Bench template for design  :  Descodificador5
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Descodificador5_vhd_tst IS
END Descodificador5_vhd_tst;
ARCHITECTURE Descodificador5_arch OF Descodificador5_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Ent : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Habilitacio : STD_LOGIC;
SIGNAL Sort : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT Descodificador5
	PORT (
	Ent : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	Habilitacio : IN STD_LOGIC;
	Sort : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Descodificador5
	PORT MAP (
-- list connections between master ports and signals
	Ent => Ent,
	Habilitacio => Habilitacio,
	Sort => Sort
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN   

	Ent<="00000";
	Habilitacio<='1';
	wait for 10 us;
	Ent<="00100";
	wait for 10 us;
	Ent<="01001";
	Habilitacio<='0';
	wait for 10 us;
	Ent<="11111";
	Habilitacio<='1';
	wait for 10 us;
                                                     
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Descodificador5_arch;
