module uart_pc_test (
    input wire clk,
    reset,
    input wire rx,
    input wire btn,
    output wire [7:0] led,
    output wire tx,
    output wire tx_full,
    rx_empty
);

  wire btn_tick;
  wire [7:0] rec_data, rec_data1;

  uart_core uart_unit (
      .clk(clk),
      .reset(reset),
      .rd_uart(btn_tick),
      .wr_uart(btn_tick),
      .rx(rx),
      .w_data(rec_data1),
      .tx_full(tx_full),
      .rx_empty(rx_empty),
      .r_data(rec_data),
      .tx(tx)
  );

  debounce btn_db_unit (
      .clk(clk),
      .reset(reset),
      .sw(btn),
      .db_level(),
      .db_tick(btn_tick)
  );

  assign rec_data1 = rec_data;
  assign led = rec_data;
endmodule
