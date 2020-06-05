/* ******************************************* *
 *                                             *
 * Name: VGA H Display V3                      *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module H_Display (input logic [9:0] H_Counts,
                  input logic HSYNC,
                  output logic display,
						output logic [9:0] Display_Col);

  reg[9:0] syncLimits = 10'd95;
  reg[9:0] backPorchLimits = 10'd143;
  reg[9:0] displayLimits = 10'd783;
  reg[9:0] frontPorchLimits = 10'd799;

  always @(*)
    begin
	   if (!HSYNC)
		  begin
		    display <= 0;
			 Display_Col <= 10'd0;
		  end
  		else if (H_Counts < syncLimits)
  		  begin
          display <= 0;
			 Display_Col <= 10'd0;
        end
      else if (H_Counts < backPorchLimits)
        begin
          display <= 0;
			 Display_Col <= 10'd0;
        end
      else if (H_Counts < displayLimits)
        begin
          display <= 1;
			 Display_Col <= Display_Col + 10'd1;
        end
      else if (H_Counts < frontPorchLimits)
        begin
          display <= 0;
			 Display_Col <= 10'd0;
        end
      else
        begin
          display <= 0;
			 Display_Col <= 10'd0;
        end
    end
endmodule
