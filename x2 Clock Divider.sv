/* ******************************************* *
 *                                             *
 * Name: x2 Clock Divider                      *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module x2_Clock_Divider (input logic clock,
                         input logic reset,
                         output logic out_clock);

  always @(posedge clock)
  begin
    if (!reset)
      out_clock <= 1'b0;
    else
      out_clock <= ~out_clock;
  end
endmodule
