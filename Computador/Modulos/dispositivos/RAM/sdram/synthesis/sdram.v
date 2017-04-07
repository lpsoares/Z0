// sdram.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module sdram (
		input  wire        altpll_areset_conduit_export, // altpll_areset_conduit.export
		output wire        altpll_locked_conduit_export, // altpll_locked_conduit.export
		output wire        altpll_sdram_clk,             //          altpll_sdram.clk
		input  wire        clk_clk,                      //                   clk.clk
		output wire        clk100_clk,                   //                clk100.clk
		input  wire        reset_reset_n,                //                 reset.reset_n
		input  wire [23:0] sdram_s1_address,             //              sdram_s1.address
		input  wire [1:0]  sdram_s1_byteenable_n,        //                      .byteenable_n
		input  wire        sdram_s1_chipselect,          //                      .chipselect
		input  wire [15:0] sdram_s1_writedata,           //                      .writedata
		input  wire        sdram_s1_read_n,              //                      .read_n
		input  wire        sdram_s1_write_n,             //                      .write_n
		output wire [15:0] sdram_s1_readdata,            //                      .readdata
		output wire        sdram_s1_readdatavalid,       //                      .readdatavalid
		output wire        sdram_s1_waitrequest,         //                      .waitrequest
		output wire [12:0] sdram_wire_addr,              //            sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                //                      .ba
		output wire        sdram_wire_cas_n,             //                      .cas_n
		output wire        sdram_wire_cke,               //                      .cke
		output wire        sdram_wire_cs_n,              //                      .cs_n
		inout  wire [15:0] sdram_wire_dq,                //                      .dq
		output wire [1:0]  sdram_wire_dqm,               //                      .dqm
		output wire        sdram_wire_ras_n,             //                      .ras_n
		output wire        sdram_wire_we_n               //                      .we_n
	);

	wire    altpll_c0_clk;                      // altpll:c0 -> [rst_controller_001:clk, sdram:clk]
	wire    rst_controller_reset_out_reset;     // rst_controller:reset_out -> altpll:reset
	wire    rst_controller_001_reset_out_reset; // rst_controller_001:reset_out -> sdram:reset_n

	sdram_altpll altpll (
		.clk                (clk_clk),                        //       inclk_interface.clk
		.reset              (rst_controller_reset_out_reset), // inclk_interface_reset.reset
		.read               (),                               //             pll_slave.read
		.write              (),                               //                      .write
		.address            (),                               //                      .address
		.readdata           (),                               //                      .readdata
		.writedata          (),                               //                      .writedata
		.c0                 (altpll_c0_clk),                  //                    c0.clk
		.c1                 (altpll_sdram_clk),               //                    c1.clk
		.areset             (altpll_areset_conduit_export),   //        areset_conduit.export
		.locked             (altpll_locked_conduit_export),   //        locked_conduit.export
		.scandone           (),                               //           (terminated)
		.scandataout        (),                               //           (terminated)
		.phasecounterselect (4'b0000),                        //           (terminated)
		.phaseupdown        (1'b0),                           //           (terminated)
		.phasestep          (1'b0),                           //           (terminated)
		.scanclk            (1'b0),                           //           (terminated)
		.scanclkena         (1'b0),                           //           (terminated)
		.scandata           (1'b0),                           //           (terminated)
		.configupdate       (1'b0),                           //           (terminated)
		.phasedone          ()                                //           (terminated)
	);

	sdram_sdram sdram (
		.clk            (altpll_c0_clk),                       //   clk.clk
		.reset_n        (~rst_controller_001_reset_out_reset), // reset.reset_n
		.az_addr        (sdram_s1_address),                    //    s1.address
		.az_be_n        (sdram_s1_byteenable_n),               //      .byteenable_n
		.az_cs          (sdram_s1_chipselect),                 //      .chipselect
		.az_data        (sdram_s1_writedata),                  //      .writedata
		.az_rd_n        (sdram_s1_read_n),                     //      .read_n
		.az_wr_n        (sdram_s1_write_n),                    //      .write_n
		.za_data        (sdram_s1_readdata),                   //      .readdata
		.za_valid       (sdram_s1_readdatavalid),              //      .readdatavalid
		.za_waitrequest (sdram_s1_waitrequest),                //      .waitrequest
		.zs_addr        (sdram_wire_addr),                     //  wire.export
		.zs_ba          (sdram_wire_ba),                       //      .export
		.zs_cas_n       (sdram_wire_cas_n),                    //      .export
		.zs_cke         (sdram_wire_cke),                      //      .export
		.zs_cs_n        (sdram_wire_cs_n),                     //      .export
		.zs_dq          (sdram_wire_dq),                       //      .export
		.zs_dqm         (sdram_wire_dqm),                      //      .export
		.zs_ras_n       (sdram_wire_ras_n),                    //      .export
		.zs_we_n        (sdram_wire_we_n)                      //      .export
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (altpll_c0_clk),                      //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	assign clk100_clk = clk_clk;

endmodule