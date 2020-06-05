/* ******************************************* *
 *                                             *
 * Name: RGB Generator                         *
 * Date: June 2, 2020                          *
 * Author: Anthony Kung                        *
 * Author URI: https://hailiga.org/anthonykung *
 *                                             *
 ***********************************************/

module RGB_Generator   (input logic [3:0] GND, RGB,
                        input logic H_Display, V_Display,
                        output logic [3:0] out_RGB);

  reg Selector;

  assign Selector = H_Display & V_Display;

  assign out_RGB = Selector ? RGB : GND;

endmodule
