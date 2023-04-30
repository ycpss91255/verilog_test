module pwm_gen(
        input clk_i,
        input rst_n_i,
        input [7:0] duty_i,
        output pwm_o
    );

    reg [7:0] cnt_r;

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            cnt_r <= 0;
        end
        else begin
            cnt_r <= (cnt_r == 255) ? 0 : cnt_r + 1;
        end
    end

    assign pwm_o = (cnt_r < duty_i) ? 1'b1 : 1'b0;

endmodule
