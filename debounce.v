module debounce (
    input  wire clk,
    reset,
    input  wire sw,
    output reg  db_level,
    output reg  db_tick
);

  localparam [1:0] HIGH = 2'b00, WAIT0 = 2'b01, LOW = 2'b10, WAIT1 = 2'b11;

  localparam N = 21;

  reg [N-1:0] q_reg, q_next;
  reg [1:0] state_reg, state_next;

  always @(posedge clk or negedge reset) begin
    if (~reset) begin
      state_reg <= HIGH;
      q_reg <= 0;
    end else begin
      state_reg <= state_next;
      q_reg <= q_next;
    end
  end

  // Debounce logic
  always @* begin
    state_next = state_reg;
    q_next = q_reg;
    db_tick = 1'b0;

    case (state_reg)
      HIGH: begin
        db_level = 1'b1;
        if (~sw) begin
          state_next = WAIT0;
          q_next = {N{1'b1}};
        end
      end

      WAIT0: begin
        db_level = 1'b1;
        if (~sw) begin
          q_next = q_reg - 1;
          if (q_next == 0) begin
            state_next = LOW;
            db_tick = 1'b1;
          end
        end else begin
          state_next = HIGH;
        end
      end

      LOW: begin
        db_level = 1'b0;
        if (sw) begin
          state_next = WAIT1;
          q_next = {N{1'b1}};
        end
      end

      WAIT1: begin
        db_level = 1'b0;
        if (sw) begin
          q_next = q_reg - 1;
          if (q_next == 0) begin
            state_next = HIGH;
          end
        end else begin
          state_next = LOW;
        end
      end

      default: state_next = HIGH;
    endcase
  end

endmodule
