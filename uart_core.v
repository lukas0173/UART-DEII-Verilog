module uart_core #(
    parameter DBIT = 8,
    SB_TICK = 16,
    DVSR = 163,
    DVSR_BIT = 8,
    FIFO_W = 2
) (
    input wire clk,
    reset,
    input wire rd_uart,
    wr_uart,
    rx,
    input wire [7:0] w_data,
    output wire tx_full,
    rx_empty,
    tx,
    output wire [7:0] r_data
);

  wire tick, rx_done_tick, tx_done_tick;
  wire tx_empty, tx_fifo_not_empty;
  wire [7:0] tx_fifo_out, rx_data_out;

  modMCounter #(
      .M(DVSR),
      .N(DVSR_BIT)
  ) baud_gen_unit (
      .clk(clk),
      .reset(reset),
      .q(),
      .max_tick(tick)
  );

  // Where is dout?
  uart_rx #(
      .data_width(DBIT),
      .SB_TICK(SB_TICK)
  ) uart_rx_unit (
      .clk(clk),
      .reset_in(reset),
      .receiver_in(rx),
      .s_tick(tick),
      .receiver_done_tick(rx_done_tick),
      .receiver_data_out(rx_data_out)
  );

  fifo #(
      .B(DBIT),
      .W(FIFO_W)
  ) fifo_rx_unit (
      .clk(clk),
      .reset(reset),
      .rd(rd_uart),
      .wr(rx_done_tick),
      .w_data(rx_data_out),
      .empty(rx_empty),
      .full(tx_full),
      .r_data(r_data)
  );

  uart_tx #(
      .data_width(DBIT),
      .SB_TICK(SB_TICK)
  ) uart_tx_unit (
      .clk(clk),
      .reset_in(reset),
      .transmitter_start(~tx_empty & wr_uart),
      .s_tick(tick),
      .din(tx_fifo_out),
      .tx_done_tick(tx_done_tick),
      .tx(tx)
  );

  assign tx_fifo_not_empty = ~tx_empty;
endmodule
