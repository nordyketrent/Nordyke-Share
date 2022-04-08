//==============================================================================================================================================================
// compressor_42
// s0[8:0] + s1[8:0] = a[7:0] + b[7:0] + c[7:0] + d[7:0] + cina + cinb
//==============================================================================================================================================================

module compressor_42 #( parameter SIZE = 3 )
(
 input             cina,
 input             cinb,
 input  [SIZE-1:0] a,
 input  [SIZE-1:0] b,
 input  [SIZE-1:0] c,
 input  [SIZE-1:0] d,
 output [SIZE:0]   s0,
 output [SIZE:0]   s1
);

wire [SIZE-1:0] xort;
wire [SIZE-2:0] carry;
wire            y0;
wire [SIZE-1:0] x0;
wire [SIZE-1:0] x1;

assign xort       = a ^ b ^ c;
assign {y0,carry} = (a & b) | (a & c) | (b & c);

assign x0         = ({carry,cina} ^ xort) ^ d;
assign x1         = (({carry,cina} | xort) & d) | ({carry,cina} & xort);

assign s0         = {y0,x0};
assign s1         = {x1,cinb};

endmodule





