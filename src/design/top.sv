/* ===========================================================================
  Filename    : top.sv                                         
  Designers   : Fernando WELZEL
  Description : Top chip module.
=========================================================================== */
module top  #(
)(
  
);

// == Variable declarations =================================================
logic [ARBITER_SEL_WIDTH-1:0] arbiter_sel;
logic [3:0] acc_enables; 
logic [2:0] acc_control;
logic ctrl_enable;

// == Block instantiation ===================================================
control_path #(
  // Setting delays
  .DELAY_ADDR(DELAY_ADDR),
  .DELAY_MULT(DELAY_MULT),
  .DELAY_ROM(DELAY_ROM),
  .DELAY_SUM(DELAY_SUM),
  .DELAY_COUNT(DELAY_COUNT),
  .DELAY_SPLIT(DELAY_SPLIT),
  .DELAY_BUFFER(DELAY_BUFFER)    
) control_path_I(
  // Left channel
  .req_left(req_left),
  .req_ghost_left(req_ghost_left),
  .ack_left(ack_left),

  // Right channel
  .req_right(req_right),
  .req_ghost_right(req_ghost_right),
  .ack_right(ack_right),

  // Memory left channel
  .mem_req_left(mem_req_left),
  .mem_req_ghost_left(mem_req_ghost_left),
  .mem_ack_left(mem_ack_left),

  // Memory right channel
  .mem_req_right(mem_req_right),
  .mem_req_ghost_right(mem_req_ghost_right),
  .mem_ack_right(mem_ack_right),

  // Connection between control path and data path
  .arbiter_sel(arbiter_sel),
  .acc_control(acc_control),
  .acc_enables(acc_enables),
  .ctrl_enable(ctrl_enable),

  // Global control signal
  .rst(rst)
);

data_path #(
    // Structural parameters
    .INPUT_SIZE(INPUT_SIZE),
    .ARBITER_SEL_WIDTH(ARBITER_SEL_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .COUNT_WIDTH(COUNT_WIDTH),
    .MAC_CONDITION(MAC_CONDITION)
) data_path_I(
  // Input data from accumulator
  .data_in(data_in),

  // Output data from accumulator
  .data_out(data_out),

  // Memory variables
  .mem_data_out(mem_data_out),

  // Connection between control path and data path
  .acc_enables(acc_enables),
  .acc_control(acc_control),
  .ctrl_enable(ctrl_enable),
  .arbiter_sel(arbiter_sel),

  // Global variables
  .rst(rst)
);

// == Block instantiation ===================================================
assign mem_addr_in = arbiter_sel;

endmodule
