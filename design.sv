module tff(t,clk,rst,q);
    input t;
    input clk;
    input rst;
    output reg q;

    always @(posedge clk or posedge rst) begin
        if(rst==1) begin 
            q<=0;
        end
        else if(t==1) begin
            q<=~q;
        end
        else begin
            q<=q;
        end
    end

endmodule