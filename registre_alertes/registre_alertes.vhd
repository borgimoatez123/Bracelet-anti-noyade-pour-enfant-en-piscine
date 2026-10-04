library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registre_alertes is
    Port (
        clk   : in  STD_LOGIC;
        rst   : in  STD_LOGIC;
        alarme : in  STD_LOGIC;
        nb    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end registre_alertes;

architecture Behavioral of registre_alertes is

    signal alarme_prec : STD_LOGIC := '0';
    signal nb_reg      : unsigned(3 downto 0) := (others => '0');

begin

    process(clk, rst)
    begin
        if rst = '1' then
            alarme_prec <= '0';
            nb_reg      <= (others => '0');

        elsif rising_edge(clk) then

            -- Détection du front montant
            if alarme = '1' and alarme_prec = '0' then

                -- Compteur avec saturation à 15
                if nb_reg < 15 then
                    nb_reg <= nb_reg + 1;
                else
                    nb_reg <= nb_reg;
                end if;

            end if;

            -- Mémorisation de l'état précédent de l'alarme
            alarme_prec <= alarme;

        end if;
    end process;

    nb <= std_logic_vector(nb_reg);

end Behavioral;
