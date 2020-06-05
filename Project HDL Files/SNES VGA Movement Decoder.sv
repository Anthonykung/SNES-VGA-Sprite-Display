/* ******************************************* *
 *                                             *
 * Name: SNES VGA Movement Decoder             *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module SNES_VGA_Movement_Decoder #(parameter wPx = 16, hPx = 16) // wPx = width of sprite, hPx = height of sprite
                                  (input logic Up, Down, Left, Right,
                                   input logic [9:0] Col, Row,
                                   output logic [9:0] Col_out, Row_out);

  always @(*)
  begin
  
    if (!Up && ((Row - hPx) >= 0))
	 begin
	   Row_out <= Row - hPx;
	 end
    else if (!Up)
	 begin
	   Row_out <= 10'd0;
	 end
	 else if (!Down && ((Row + hPx) <= 640))
	 begin
	   Row_out <= Row + hPx;
	 end
	 else if (!Down)
	 begin
	   Row_out <= 10'd640 - hPx;
	 end
	 else if (!Left && ((Col - wPx) >= 0))
	 begin
	   Col_out <= Col - wPx;
	 end
	 else if (!Left)
	 begin
	   Col_out <= 10'd0;
	 end
	 else if (!Right && ((Col + wPx) <= 480))
	 begin
	   Col_out <= Col + wPx;
	 end
	 else if (!Left)
	 begin
	   Col_out <= 10'd480 - wPx;
	 end
	 else
	 begin
	   Row_out <= Row;
	   Col_out <= Col;
	 end
	 
	 
  end
  

endmodule
