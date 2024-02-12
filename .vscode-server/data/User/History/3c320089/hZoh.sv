/*
 * Turning all checks on with check5
 */
`ifdef check5
`define check1 
`define check2 
`define check3 
`define check4
`endif 

module ex1_1_property 
  (
   input 	      clk, rst, validi,
   input [31:0]       data_in,
   input logic 	      valido, 
   input logic [31:0] data_out
   );

/*------------------------------------
 *
 *        CHECK # 1. Check that when 'rst' is asserted (==1) that data_out == 0
 *
 *------------------------------------ */

`ifdef check1
/* -----\/----- EXCLUDED -----\/-----

property reset_asserted;
   @(posedge clk) data_in |=> data_out; //DUMMY - REMOVE  this line and code correct assertion
endproperty

reset_check: assert property(reset_asserted)
  $display($stime,,,"\t\tRESET CHECK PASS:: rst_=%b data_out=%0d \n",
	   rst, data_out);
else $display($stime,,,"\t\RESET CHECK FAIL:: rst_=%b data_out=%0d \n",
	      rst, data_out);
 -----/\----- EXCLUDED -----/\-----  */
 property reset_asserted;
   @(posedge clk) rst |-> !data_out; //check that data_out is zero when rst = 1 
 endproperty

 reset_check: assert property(reset_asserted)
   $display($stime,,,"\t\tRESET CHECK PASS:: rst_=%b data_out=%0d \n",
	   rst, data_out);
 else $display($stime,,,"\t\tRESET CHECK FAIL:: rst_=%b data_out=%0d \n",
	      rst, data_out);
`endif

/* ------------------------------------
 * Check valido assertion to hold 
 *
 *       CHECK # 2. Check that valido is asserted when validi=1 for three
 *                  consecutive clk cycles
 * 
 * ------------------------------------ */

`ifdef check2
property valido_asserted;
   @(posedge clk) validi ##1 validi ##1 validi |=> valido; //check that valido=1 if validi=1 is high for 3 cycles
 endproperty

 valido_check: assert property(valido_asserted)
   $display($stime,,,"\t\tVALIDO CHECK PASS:: validi=%b valido=%b \n",
	   validi, valido);
 else $display($stime,,,"\t\tVALIDO CHECK FAIL:: validi=%b valido=%b \n",
	      validi, valido);
`endif

/* ------------------------------------
 * Check valido not asserted wrong 
 *
 *       CHECK # 3. Check that valido is not asserted when validi=1 for only two, one
 *                  or zero consecutive clk cycles
 * 
 * ------------------------------------ */

`ifdef check3
property valido_not_asserted;
   @(posedge clk) validi ##[0:4] !valido; //
 endproperty

 valido_check: assert property(valido_not_asserted)
   $display($stime,,,"\t\tVALIDO CHECK PASS:: validi=%b valido=%b \n",
	   validi, valido);
 else $display($stime,,,"\t\tVALIDO CHECK FAIL:: validi=%b valido=%b \n",
	      validi, valido);
`endif

/* ------------------------------------
 * Check data_out value 
 *
 *       CHECK # 4. Check that data_out when valido=1 is equal to a*b+c where a is data_in
 *       two cycles back, b is data_in one cycle back, and c is the present data_in
 * 
 * ------------------------------------ */

`ifdef check4
`endif

endmodule
