module uart_tx #(
    parameter data_width = 8,
    parameter SB_TICK = 16
) (
    input wire clk,
    reset_in,
    input wire transmitter_start,
    s_tick,
    input wire [7:0] din,
    output reg tx_done_tick,
    output wire tx
);

  localparam [1:0] IDLE = 2'b00, START = 2'b01, DATA = 2'b10, STOP = 2'b11;

  reg [1:0] state_reg, state_next;
  reg [3:0] s_reg, s_next;
  reg [2:0] n_reg, n_next;
  reg [7:0] b_reg, b_next;
  reg tx_next, tx_reg;

  always @(posedge clk or negedge reset_in)
    if (~reset_in) begin
      state_reg <= IDLE;
      s_reg <= 0;
      n_reg <= 0;
      b_reg <= 0;
      tx_reg <= 1'b1;
    end else begin
      state_reg <= state_next;
      s_reg <= s_next;
      n_reg <= n_next;
      b_reg <= b_next;
      tx_reg <= tx_next;
    end

  always @* begin
    state_next   = state_reg;
    tx_done_tick = 1'b0;
    s_next       = s_reg;
    b_next       = b_reg;
    n_next       = n_reg;
    tx_next      = tx_reg;

    case (state_reg)
        IDLE: begin
            if (transmitter_start) begin
                state_next = START;
                s_next     = 0;
                b_next     = din;
            end
        end
        START: begin
            tx_next = 1'b0;
            if (s_tick) begin
                if (s_reg == 15) begin
                    s_next = 0;
                    b_next = b_reg >> 1;
                    if (n_reg == (data_width - 1)) state_next = STOP;
                    else n_next = n_reg + 1;
                end else s_next = s_reg + 1;
            end
        end
        STOP: begin
            tx_next = 1'b1;
            if (s_tick) begin
                if (s_reg == (SB_TICK - 1)) begin
                    state_next   = IDLE;
                    tx_done_tick = 1'b1;
                end else s_next = s_reg + 1;
            end
        end
    endcase
end

  assign tx = tx_reg;
endmodule
