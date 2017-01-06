module clkRateTool32
  #(parameter CLKREF_RATE_IN_MHZ = 100)  // rate of 'clkref' in MHz
  (input 	     clkref,   // reference clock used to compare against clktest
   input 	     clktest, // clock to be measured
   input 	     clkvalue, // clock used to sync the output value (can be clkref or clktest or different clock)
   output reg [31:0] value);
	 
   // maximum rate of clkref is 838 MHz (2^23). Can increase
   // REFCTR_MSB if need to use with a faster clkref.
   parameter REFCTR_SIZE = 23; 
   
   // **** clkref Clock Domain ****
   //
   reg [REFCTR_SIZE-1:0] refCtr;      
   reg [REFCTR_SIZE-1:0] rateCtr;
   reg 		         counting_clkref;

   // clktest_div2 is really in clktest clock domain 
   // but referenced in this clock domain
   reg 			 clktest_div2; 

   reg 			 clktest_div2_ref1;      
   reg 			 clktest_div2_ref2;
   reg 			 clktest_div2_post;
   
   // number of counts of refCtr in 10 ms (minus 1)
   parameter REFCTR_TERMINAL = (((CLKREF_RATE_IN_MHZ*1000000)/100)-1);
   
   always @(posedge clkref) refCtr <= refCtr + 'b1;

   // Count the number of rising edges of clktest/2 seen in 10 ms.
   // Using clktest/2 instead of clktest because sometimes connecting
   // a clock directly to logic can cause clock skew. Using a div 2
   // clock reduces precision by only a single bit, which is not bad
   // in most cases.
   always @(posedge clkref) begin
      clktest_div2_ref1 <= clktest_div2;
      clktest_div2_ref2 <= clktest_div2_ref1;
      clktest_div2_post <= clktest_div2_ref2;

      if (refCtr == {REFCTR_SIZE{1'b1}}) begin
	 // At the largest count possible for refCtr, reset rateCtr
	 // and indicate that rateCtr is being modified by asserting
	 // counting_clkref.
	 counting_clkref <= 1;
	 rateCtr <= 0;
      end else if (refCtr <= REFCTR_TERMINAL) begin
	 // While within the 10 ms time, count every rising edge of clktest/2
	 counting_clkref <= 1;
	 if (clktest_div2_ref2 && !clktest_div2_post)
	   rateCtr <= rateCtr + 'b1;
      end else begin
	 // Done with 10 ms timer, so deassert counting_clkref so
	 // other clock domain knows it can safely copy rateCtr, which
	 // is being kept unmodified.
	 counting_clkref <= 0;
	 rateCtr <= rateCtr;
      end	 

   end

   //
   // **** clkref Clock Domain ****
   

   // **** clktest Clock Domain ****
   //

   // Create a signal that is clktest/2 so can interface clktest to
   // logic without causing any possible clock skew
   always @(posedge clktest) begin
      clktest_div2 <= !clktest_div2;
   end
   
   //
   // **** clktest Clock Domain ****

   // **** clkvalue Clock Domain ****
   //
   reg 		     counting_sync1;
   reg 		     counting_sync2;
   reg 		     counting;
   reg 		     counting_post;

   // sync counting_clkref to clkvalue. Use extra f/f just in case.
   always @(posedge clkvalue) begin
      counting_sync1 <= counting_clkref;
      counting_sync2 <= counting_sync1;
      counting      <= counting_sync2;
      counting_post <= counting;
   end

   always @(posedge clkvalue) begin
      if (!counting && counting_post)
	// On falling edge of counting, copy rateCtr*2 from clkref
	// clock domain to value in the clkvalue clock domain.  This
	// makes 'value' the measured frequency of clktest in 100
	// Hz. Using a left bit shift to do the *2 which compensates
	// for the use of clktest/2.
   	value <= {{32-REFCTR_SIZE-1{1'b0}}, rateCtr, 1'b0};
   end

   //
   // **** clkvalue Clock Domain ****
   
endmodule