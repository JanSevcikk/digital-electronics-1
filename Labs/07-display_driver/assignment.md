# Lab 7: Jan Ševčík

### Display driver

1. Listing of VHDL code of the completed process `p_mux`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                sig_hex <= data0;
                dp  <= dp_vect(0);
                dig <= "1110";
            else
                case sig_cnt is
                    when "11" =>
                        sig_hex <= data3; -- prirazeni dat do segmentovky
                        dp  <= dp_vect(3); -- zda sviti desetinna tecka
                        dig <= "0111"; -- ktera segmentovka sepnuta

                    when "10" =>
                        sig_hex <= data2;
                        dp  <= dp_vect(2);
                        dig <= "1011";

                    when "01" =>
                        sig_hex <= data1;
                        dp <= dp_vect(1);
                        dig <= "1101";

                    when others =>
                        sig_hex <= data0;
                        dp  <= dp_vect(0);
                        dig <= "1110";
                end case;
            end if;
        end if;
    end process p_mux;
```

### Eight-digit driver

1. Image of the 8-digit driver's block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components, and internal signals!

   ![8digit schematic](images/8segment.png)
