`timescale 1ps / 1ps

module hamming_encoder (
    input  wire        clk, 
    input  wire        arst, // asynchronous reset
    input  wire [7:0]  data, 
    output reg [11:0]  q
);
   
    wire p0, p1, p2, p3;
   
    assign p0 = data[6] ^ data[4] ^ data[3] ^ data[1] ^ data[0];
    assign p1 = data[6] ^ data[5] ^ data[3] ^ data[2] ^ data[0];
    assign p2 = data[7] ^ data[3] ^ data[2] ^ data[1];
    assign p3 = data[7] ^ data[6] ^ data[5] ^ data[4];
   
    always @ (posedge clk or posedge arst)
        begin
            if (arst)
                begin
                    q <= 0;
                end
            else
                begin	 
                    q <= {data[7:4], p3, data[3:1],p2, data[0], p1, p0};
                end
   end

endmodule
