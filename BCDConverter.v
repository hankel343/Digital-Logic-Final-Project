module BCDConverter(s0, s1, s2, s3, s4, s5, n2x3, n2x2, n2x1, n2x0, n1x3, n1x2, n1x1, n1x0);
    input s5, s4, s3, s2, s1, s0; //s5 MSB ... s0 LSB 
	// s5 = A, 
	//s4 = B, 
	//s3 = C, 
	//s2 = D, 
	//s1 = E, 
	//s0 = F
	
    output n2x3, n2x2, n2x1, n2x0, n1x3, n1x2, n1x1, n1x0;

    assign n2x3 = 0;
	//             AC       +   AB    
    assign n2x2 = (s5 & s3) | (s5 & s4);
	//             A'BD           +  A'BC           +  BCD           +  AB'C'
	assign n2x1 = (~s5 & s4 & s2) | (~s5 & s4 & s3) | (s4 & s3 & s2) | (s5 & ~s4 & ~s3);
	//             A     B'    C'  +  A     C'   E
	assign n2x0 = (s5 & ~s4 & ~s3) | (s5 & ~s3 & s1) | (s5 & ~s3 & s2) | (~s5 & ~s4 & s3 & s2) | (~s5 & ~s4 & s3 & s1) | (~s5 & s3 & s2 & s1) | (~s5 & s4 & ~s3 & ~s2) | (s5 & s4 & s3 & ~s2);
	//             A'B'CD'E'                   +  A'BC'D'E                   +   A'BCDE'                  +  AB'C'DE                   +  ABC'D'E'                   +  ABCD'E
	assign n1x3 = (~s5 & ~s4 & s3 & ~s2 & ~s1) | (~s5 & s4 & ~s3 & ~s2 & s1) | (~s5 & s4 & s3 & s2 & ~s1) | (s5 & ~s4 & ~s3 & s2 & s1) | (s5 & s4 & ~s3 & ~s2 & ~s1) | (s5 & s4 & s3 & ~s2 & s1);
	//             A'    B'     C'   D   +  B'    C    D     E  +  A'    B     D'    E'  +  A'    B    C     D'  +  B    C      D'   E'
 	assign n1x2 = (~s5 & ~s4 & ~s3 & s2) | (~s4 & s3 & s2 & s1) | (~s5 & s4 & ~s2 & ~s1) | (~s5 & s4 & s3 & ~s2) | (s4 & s3 & ~s2 & ~s1) | (s5 & ~s4 & s2 & ~s1) | (s5 & ~s4 & ~s3 & ~s2 & s1) | (s5 & s4 & ~s3 & s2 & s1);
	
	assign n1x1 = (~s5 & ~s4 & ~s3 & s1) | (~s5 & ~s3 & s2 & s1) | (s5 & ~s4 & ~s3 & ~s1) | (s5 & ~s3 & s2 & ~s1) | (s5 & ~s4 & s3 & s1) | (s5 & s3 & s2 & s1) | (~s5 & ~s4 & s3 & s2 & ~s1) | (~s5 & s4 & ~s3 & ~s2 & ~s1) | (~s5 & s4 & s3 & ~s2 & s1) | (s5 & s4 & s3 & ~s2 & ~s1);
	
	assign n1x0 = s0;
	
	
endmodule