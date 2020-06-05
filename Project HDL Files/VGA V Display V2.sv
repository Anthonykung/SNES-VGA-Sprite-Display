/* ******************************************* *
 *                                             *
 * Name: VGA V Display V3                      *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module V_Display (input logic [9:0] V_Counts,
                  input logic VSYNC,
                  output logic display,
						output logic [9:0] Display_Row);

  reg[9:0] syncLimits = 10'd1;
  reg[9:0] backPorchLimits = 10'd34;
 	reg[9:0] displayLimits = 10'd514;
 	reg[9:0] frontPorchLimits = 10'd524;

 	always @(*)
    begin
	   if (!VSYNC)
		  begin
		    display <= 0;
			 Display_Row <= 10'd0;
		  end
      else if (V_Counts < syncLimits)
  			begin
          display <= 0;
			 Display_Row <= 10'd0;
        end
      else if (V_Counts < backPorchLimits)
        begin
          display <= 0;
			 Display_Row <= 10'd0;
        end
      else if (V_Counts < displayLimits)
        begin
          display <= 1;
			 Display_Row <= Display_Row + 10'd1;
        end
      else if (V_Counts < frontPorchLimits)
        begin
          display <= 0;
			 Display_Row <= 10'd0;
        end
      else
        begin
          display <= 0;
			 Display_Row <= 10'd0;
        end
    end
endmodule
