module uart_rx #(
    parameter data_width = 8,
    parameter SB_TICK = 16
) (
    input wire clk,
    input wire reset_in,
    input wire receiver_in,
    input wire s_tick,
    output reg receiver_done_tick,
    output wire [data_width-1:0] receiver_data_out,
    output wire [7:0] dout
);

  parameter idle = 2'b00;
  parameter start = 2'b01;
  parameter data = 2'b10;
  parameter stop = 2'b11;

  reg [1:0] state_reg, state_next;
  reg [3:0] s_reg, s_next;
  reg [2:0] n_reg, n_next;
  reg [7:0] b_reg, b_next;

  always @(posedge clk or negedge reset_in)
    if (~reset_in) begin
      state_reg <= idle;
      s_reg <= 0;
      n_reg <= 0;
      b_reg <= 0;
    end else begin
      state_reg <= state_next;
      s_reg <= s_next;
      n_reg <= n_next;
      b_reg <= b_next;
    end

  always @* begin
    state_next = state_reg;
    s_next = s_reg;
    n_next = n_reg;
    b_next = b_reg;
    receiver_done_tick = 0;
    case (state_reg)
      idle:
      if (~receiver_in) begin
        state_next = start;
        s_next = 0;
      end
      start:
      if (s_tick)
        if (s_reg == 7) begin
          state_next = data;
          s_next = 0;
          n_next = 0;
        end else s_next = s_reg + 1;
      data:
      if (s_tick)
        if (s_reg == 15) begin
          s_next = 0;
          b_next = {receiver_in, b_reg[7:1]};
          if (n_reg == data_width - 1) state_next = stop;
          else n_next = n_reg + 1;
        end else s_next = s_reg + 1;
      stop:
      if (s_tick)
        if (s_reg == (SB_TICK - 1)) begin
          state_next = idle;
          receiver_done_tick = 1;
        end else s_next = s_reg + 1;
    endcase
  end
  assign dout = b_reg;
  assign receiver_data_out = b_reg;
endmodule
