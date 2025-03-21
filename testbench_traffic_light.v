module testbench_traffic_light;

reg clk;
wire red, yellow, green;

traffic_light dut (
    .clk(clk),
    .red(red),
    .yellow(yellow),
    .green(green)
);

initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, testbench_traffic_light);

    clk = 0;
    #5;
    repeat (20) begin
        #5 clk = ~clk;
    end
    $finish;
end

always @(posedge clk) begin
    $display("At time %0t: red = %b, yellow = %b, green = %b", $time, red, yellow, green);
end

endmodule