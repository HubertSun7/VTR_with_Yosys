/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 27178 -fractionalBits 0*/
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
    w4,
    w5,
    w128,
    w127,
    w20,
    w107,
    w13696,
    w13589,
    w27178;

  assign w1 = i_data0;
  assign w107 = w127 - w20;
  assign w127 = w128 - w1;
  assign w128 = w1 << 7;
  assign w13589 = w13696 - w107;
  assign w13696 = w107 << 7;
  assign w20 = w5 << 2;
  assign w27178 = w13589 << 1;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;

  assign o_data0 = w27178;

  //multiplier_block area estimate = 6057.37431490147;
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