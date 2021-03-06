library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BancRegistres is
	Port ( Reset : in STD_LOGIC;
		clk : in STD_LOGIC;
		esc : in STD_LOGIC;
		rdest : in STD_LOGIC_VECTOR(4 downto 0);
		dades : in STD_LOGIC_VECTOR(31 downto 0);
		lSor1: in STD_LOGIC;
		rf1 : in STD_LOGIC_VECTOR(4 downto 0);
		lSor2: in STD_LOGIC;
		rf2 : in STD_LOGIC_VECTOR(4 downto 0);
		sor1 : out STD_LOGIC_VECTOR(31 downto 0);
		sor2 : out STD_LOGIC_VECTOR(31 downto 0));
end BancRegistres;

architecture Behavioral of BancRegistres is

	--Creem unes senyals per seleccionar quina sortida del registre de 3 estats agafem
	signal select1 : STD_LOGIC_VECTOR (31 downto 0);
	signal select2 : STD_LOGIC_VECTOR (31 downto 0);
	signal Sortidreg : STD_LOGIC_VECTOR (31 downto 0);

	-- Cridem els components dels altres arxius


	component RegistreZero is
		Port (  clk : in STD_LOGIC;
			reset : in 	STD_LOGIC;
			E1 : in STD_LOGIC; 
			E2 : in STD_LOGIC; 
			Dout1 : out STD_LOGIC_VECTOR(31 downto 0); 
			Dout2 : out STD_LOGIC_VECTOR(31 downto 0)); 
	end component;

	component Descodificador5 is
	Port ( Habilitacio: in STD_LOGIC;
		Ent : in STD_LOGIC_VECTOR (4 downto 0);
		Sort : out STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component RegSortida3Estats is
		Port ( Reset : in STD_LOGIC;
			clk : in STD_LOGIC;
			WE : in STD_LOGIC;
			Din : in STD_LOGIC_VECTOR (31 downto 0);
			E1 : in STD_LOGIC;
			E2 : in STD_LOGIC;
			Dout1 : out STD_LOGIC_VECTOR (31 downto 0);
			Dout2 : out STD_LOGIC_VECTOR (31 downto 0));	
	end component;

begin
	-- Descodifiquem les entrades del banc per saber si tenim que escriure o no i quina sortida tenim que triar.

	dec1 : Descodificador5 port map(
		Habilitacio => lSor1,
		Ent => rf1,
		Sort => select1
	);
	dec2 : Descodificador5 port map(
		Habilitacio => lSor2,
		Ent => rf2,
		Sort => select2
	);
	dec3 : Descodificador5 port map(
		Habilitacio => esc,
		Ent => rdest,
		Sort => Sortidreg
	);

	-- Creem els registres, el 0 és diferent als altres ja que només pot tenir el valor 0

	reg0 : RegistreZero port map (clk,reset,select1(0),select2(0),sor1,sor2);
	reg1 : RegSortida3Estats port map (reset,clk,Sortidreg(1),dades,select1(1),select2(1),sor1,sor2);
	reg2 : RegSortida3Estats port map (reset,clk,Sortidreg(2),dades,select1(2),select2(2),sor1,sor2);
	reg3 : RegSortida3Estats port map (reset,clk,Sortidreg(3),dades,select1(3),select2(3),sor1,sor2);
	reg4 : RegSortida3Estats port map (reset,clk,Sortidreg(4),dades,select1(4),select2(4),sor1,sor2);
	reg5 : RegSortida3Estats port map (reset,clk,Sortidreg(5),dades,select1(5),select2(5),sor1,sor2);
	reg6 : RegSortida3Estats port map (reset,clk,Sortidreg(6),dades,select1(6),select2(6),sor1,sor2);
	reg7 : RegSortida3Estats port map (reset,clk,Sortidreg(7),dades,select1(7),select2(7),sor1,sor2);
	reg8 : RegSortida3Estats port map (reset,clk,Sortidreg(8),dades,select1(8),select2(8),sor1,sor2);
	reg9 : RegSortida3Estats port map (reset,clk,Sortidreg(9),dades,select1(9),select2(9),sor1,sor2);
	reg10 : RegSortida3Estats port map (reset,clk,Sortidreg(10),dades,select1(10),select2(10),sor1,sor2);
	reg11 : RegSortida3Estats port map (reset,clk,Sortidreg(11),dades,select1(11),select2(11),sor1,sor2);
	reg12 : RegSortida3Estats port map (reset,clk,Sortidreg(12),dades,select1(12),select2(12),sor1,sor2);
	reg13 : RegSortida3Estats port map (reset,clk,Sortidreg(13),dades,select1(13),select2(13),sor1,sor2);
	reg14 : RegSortida3Estats port map (reset,clk,Sortidreg(14),dades,select1(14),select2(14),sor1,sor2);
	reg15 : RegSortida3Estats port map (reset,clk,Sortidreg(15),dades,select1(15),select2(15),sor1,sor2);
	reg16 : RegSortida3Estats port map (reset,clk,Sortidreg(16),dades,select1(16),select2(16),sor1,sor2);
	reg17 : RegSortida3Estats port map (reset,clk,Sortidreg(17),dades,select1(17),select2(17),sor1,sor2);
	reg18 : RegSortida3Estats port map (reset,clk,Sortidreg(18),dades,select1(18),select2(18),sor1,sor2);
	reg19 : RegSortida3Estats port map (reset,clk,Sortidreg(19),dades,select1(19),select2(19),sor1,sor2);
	reg20 : RegSortida3Estats port map (reset,clk,Sortidreg(20),dades,select1(20),select2(20),sor1,sor2);
	reg21 : RegSortida3Estats port map (reset,clk,Sortidreg(21),dades,select1(21),select2(21),sor1,sor2);
	reg22 : RegSortida3Estats port map (reset,clk,Sortidreg(22),dades,select1(22),select2(22),sor1,sor2);
	reg23 : RegSortida3Estats port map (reset,clk,Sortidreg(23),dades,select1(23),select2(23),sor1,sor2);
	reg24 : RegSortida3Estats port map (reset,clk,Sortidreg(24),dades,select1(24),select2(24),sor1,sor2);
	reg25 : RegSortida3Estats port map (reset,clk,Sortidreg(25),dades,select1(25),select2(25),sor1,sor2);
	reg26 : RegSortida3Estats port map (reset,clk,Sortidreg(26),dades,select1(26),select2(26),sor1,sor2);
	reg27 : RegSortida3Estats port map (reset,clk,Sortidreg(27),dades,select1(27),select2(27),sor1,sor2);
	reg28 : RegSortida3Estats port map (reset,clk,Sortidreg(28),dades,select1(28),select2(28),sor1,sor2);
	reg29 : RegSortida3Estats port map (reset,clk,Sortidreg(29),dades,select1(29),select2(29),sor1,sor2);
	reg30 : RegSortida3Estats port map (reset,clk,Sortidreg(30),dades,select1(30),select2(30),sor1,sor2);
	reg31 : RegSortida3Estats port map (reset,clk,Sortidreg(31),dades,select1(31),select2(31),sor1,sor2);

end Behavioral;