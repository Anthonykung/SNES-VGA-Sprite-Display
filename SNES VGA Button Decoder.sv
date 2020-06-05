/* ******************************************* *
 *                                             *
 * Name: SNES VGA Button Decoder               *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module SNES_VGA_Button_Decoder  (input logic Select, Start, A, B, X, Y,
                                   output logic [3:0] RED, GREEN, BLUE);
  
  always @(*)
  begin
  
    if (!Select)
	 begin
	   RED <= 4'd0;
		GREEN <= 4'd0;
		BLUE <= 4'd0;
	 end
	 
	 else if (!Start)
	 begin
	   RED <= 4'd15;
		GREEN <= 4'd15;
		BLUE <= 4'd15;
	 end
	 
	 else if (!A)
	 begin
	   RED <= 4'd0;
		GREEN <= 4'd15;
		BLUE <= 4'd15;
	 end
	 
	 else if (!B)
	 begin
	   RED <= 4'd0;
		GREEN <= 4'd0;
		BLUE <= 4'd15;
	 end
	 
	 else if (!X)
	 begin
	   RED <= 4'd0;
		GREEN <= 4'd15;
		BLUE <= 4'd0;
	 end
	 
	 else if (!Y)
	 begin
	   RED <= 4'd15;
		GREEN <= 4'd15;
		BLUE <= 4'd0;
	 end
	 
	 else
	 begin
	   RED <= RED;
		GREEN <= GREEN;
		BLUE <= BLUE;
	 end
	 
	 
  end
  

endmodule
