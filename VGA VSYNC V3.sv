/* ******************************************* *
 *                                             *
 * Name: VGA VSYNC V3                          *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module VSYNC (input logic clock, reset,
              output logic [9:0] totalCounts,
              output logic out_clock);

	reg[9:0] lowLimits = 10'd1;
	reg[9:0] highLimits = 10'd524;

	always @(posedge clock)
    begin
	   if (!reset)
		  begin
		    totalCounts <= 10'd0;
          out_clock <= 0;
		  end
		else if (totalCounts == 0)
		  begin
          totalCounts <= 10'd1;
          out_clock <= 0;
        end
      else if (totalCounts < lowLimits)
        begin
          totalCounts <= totalCounts + 10'd1;
          out_clock <= 0;
        end
      else if (totalCounts < highLimits)
        begin
          totalCounts <= totalCounts + 10'd1;
          out_clock <= 1;
        end
      else
        begin
          totalCounts <= 10'd0;
          out_clock <= 0;
        end
    end
endmodule
