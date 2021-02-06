	component Original_Sine is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			a      : in  std_logic_vector(14 downto 0) := (others => 'X'); -- a
			c      : out std_logic_vector(13 downto 0);                    -- c
			s      : out std_logic_vector(13 downto 0)                     -- s
		);
	end component Original_Sine;

	u0 : component Original_Sine
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			a      => CONNECTED_TO_a,      --      a.a
			c      => CONNECTED_TO_c,      --      c.c
			s      => CONNECTED_TO_s       --      s.s
		);

