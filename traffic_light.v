module traffic_light(
    input wire clk,
    output reg red,
    output reg yellow,
    output reg green
);

reg [1:0] state;

always @(posedge clk) begin
    if (state == 2'b00) begin // Red signal
        red <= 1;
        yellow <= 0;
        green <= 0;
        state <= 2'b01;
    end
    else if (state == 2'b01) begin // Red and Yellow signal
        red <= 1;
        yellow <= 1;
        green <= 0;
        state <= 2'b10;
    end
    else if (state == 2'b10) begin // Green signal
        red <= 0;
        yellow <= 0;
        green <= 1;
        state <= 2'b11;
    end
    else if (state == 2'b11) begin // Yellow signal
        red <= 0;
        yellow <= 1;
        green <= 0;
        state <= 2'b00;
    end
    else begin
        red <= 0;
        yellow <= 0;
        green <= 0;
        state <= 2'b00;
    end
end

endmodule