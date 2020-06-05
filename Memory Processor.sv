/* ******************************************* *
 *                                             *
 * Name: Memory Processor                      *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/
 
 module Memory_Processor #(parameter N = 12, Size = 16)
                          (input logic [9:0] Row, Col,
								   output logic [N-1:0] Address);
								  
  assign Address = Row * Size + Col;
endmodule 