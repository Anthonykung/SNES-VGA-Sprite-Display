/* ******************************************* *
 *                                             *
 * Name: RGB Decoder                           *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module RGB_Decoder (input logic RED,
                    input logic GREEN,
                    input logic BLUE,
                    output logic [3:0] out_RED,
                    output logic [3:0] out_GREEN,
                    output logic [3:0] out_BLUE);

  reg[3:0] MAX = 4'b1111;
  reg[3:0] MIN = 4'b0000;

  always @(*)
  begin
    out_RED <= MIN;
    out_GREEN <= MIN;
    out_BLUE <= MIN;
    
    if (RED)
      out_RED <= MAX;

    if (GREEN)
      out_GREEN <= MAX;

    if (BLUE)
      out_BLUE <= MAX;
  end
endmodule
