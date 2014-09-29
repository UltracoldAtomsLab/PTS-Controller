module vJTAG_interface (
	// regular jtag io
	input tck, tdi, aclr, ir_in,v_sdr, udr,
	output reg [7:0] DR,
	output reg tdo,
	
	// my functionality
	input      iCLOCK_50,
	output reg oFLAG
);

//reg DR0_bypass_reg; // Safeguard in case bad IR is sent through JTAG 
reg [7:0] DR1; // Date, time and revision DR.  We could make separate Data Registers for each one, but
reg [2:0] Counter_get_byte;
reg [15:0] gotten_delay;
reg [3:0] Counter_flag_prolong;

//wire select_DR0 = !ir_in; // Default to 0, which is the bypass register
//wire select_DR1 = ir_in; //Data Register 1 will collect the new LED Settings


always @ (posedge tck or posedge aclr) begin
	if (aclr) begin
		//DR0_bypass_reg <= 1'b0;
		DR1 <= 8'd0;
		DR  <= 8'd0;
		Counter_get_byte <= 3'b000;
	end
	else begin
//		DR0_bypass_reg <= tdi; //Update the Bypass Register Just in case the incoming data is not sent to DR1
//		if ( v_sdr )  // VJI is in Shift DR state
//			if (select_DR1) //ir_in has been set to choose DR1
//				DR1 <= {tdi, DR1[7:1]}; // Shifting in (and out) the data
		Counter_get_byte <= Counter_get_byte + 1'b1;
		DR1              <= {tdi, DR1[7:1]}; // Shifting in (and out) the data
		if(Counter_get_byte == 3'b111)
			DR <= {tdi, DR1[7:1]};
	end
end

always @ (posedge iCLOCK_50 or posedge aclr) begin
	if(aclr) begin
		oFLAG <= 1'b0;
		gotten_delay <= 16'h0;
		Counter_flag_prolong <= 4'h0;
	end
	else begin
		gotten_delay <= {gotten_delay[14:0],(Counter_get_byte == 3'b111)};
		if(gotten_delay[15]==1'b1)
			oFLAG <= 1'b1;
		else begin
			Counter_flag_prolong <= Counter_flag_prolong + oFLAG;
			if(Counter_flag_prolong == 4'hf)
				oFLAG <= 1'b0;
		end
	end
end


//Maintain the TDO Continuity
always @ (*) begin
	tdo <= DR1[0];
//	LEDs <= DR1; //TEST
//	if (select_DR1)
//		tdo <= DR1[0];
//    else 
//		tdo <= DR0_bypass_reg;	
end		

//The udr signal will assert when the data has been transmitted and it's time to Update the DR
//  so copy it to the Output LED register. 
//  Note that connecting the LED's to the DR1 register will cause an unwanted behavior as data is shifted through it
/*always @(udr)
begin
	LEDs <= DR1;
end*/


endmodule

