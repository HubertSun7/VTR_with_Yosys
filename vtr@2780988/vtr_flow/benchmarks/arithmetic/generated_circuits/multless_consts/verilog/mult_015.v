/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 3464 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w16,
    w17,
    w4,
    w13,
    w416,
    w433,
    w3464;

  assign w1 = i_data0;
  assign w13 = w17 - w4;
  assign w16 = w1 << 4;
  assign w17 = w1 + w16;
  assign w3464 = w433 << 3;
  assign w4 = w1 << 2;
  assign w416 = w13 << 5;
  assign w433 = w17 + w416;

  assign o_data0 = w3464;

  //multiplier_block area estimate = 4637.00162866618;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule
