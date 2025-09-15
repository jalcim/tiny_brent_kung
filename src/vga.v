/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module vga_example(
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;

  // TinyVGA PMOD
  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  wire [9:0] x_px;
  wire [9:0] y_px;
  wire activevideo;
  
  reg [19:0] tm;
  reg [9:0] y_prv;

  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(activevideo),
    .hpos(x_px),
    .vpos(y_px)
  );

  wire [7:0] noise_value;
  
  worley_noise_generator worley_inst (
      .clk(clk),
      .x(x_px),
      .y(y_px),
      .t(tm),
      .noise(noise_value)
  );

  assign R = activevideo ? { noise_value[7], noise_value[2] } : 2'b00;
  assign G = activevideo ? { noise_value[6], noise_value[3] } : 2'b00;
  assign B = activevideo ? { noise_value[5], noise_value[4] } : 2'b00;
  
  always @(posedge clk) begin
    if (~rst_n) begin
      tm <= 0;
    end else begin
      y_prv <= y_px;
      if (y_px == 0 && y_prv != y_px) begin
          tm <= tm + 1;
      end
    end
  end
  
endmodule


module worley_noise_generator (
    input wire clk,
    input wire [9:0] x,
    input wire [9:0] y,
    input wire [19:0] t,
    output reg [7:0] noise
);

  // Define a small fixed grid of points
  reg [8:0] points_x[0:3];
  reg [8:0] points_y[0:3];


  assign points_x[0] = 100 + t;
  assign points_y[0] = 100 - t;
  assign points_x[1] = 300 - (t >> 1);
  assign points_y[1] = 200 + (t >> 1);
  assign points_x[2] = 500 + (t >> 1);
  assign points_y[2] = 400 - (t >> 4);
  assign points_x[3] = 100 - (t >> 3);
  assign points_y[3] = 500 - (t >> 2);

  wire [15:0] distance1 = (x - points_x[0]) * (x - points_x[0]) + (y - points_y[0]) * (y - points_y[0]);
  wire [15:0] distance2 = (x - points_x[1]) * (x - points_x[1]) + (y - points_y[1]) * (y - points_y[1]);
  wire [15:0] distance3 = (x - points_x[2]) * (x - points_x[2]) + (y - points_y[2]) * (y - points_y[2]);
  wire [15:0] distance4 = (x - points_x[3]) * (x - points_x[3]) + (y - points_y[3]) * (y - points_y[3]);
  wire [15:0] min_dist = 
    (distance1 < distance2) ? 
      (distance1 < distance3) ? 
        (distance1 < distance4) ? distance1 : distance4 : 
        (distance3 < distance4) ? distance3 : distance4 :
      (distance2 < distance3) ?
        (distance2 < distance4) ? distance2 : distance4 :
        (distance3 < distance4) ? distance3 : distance4;

  assign noise = ~min_dist[15:8];  // Scale down to 8-bit value
  
endmodule

`ifndef HVSYNC_GENERATOR_H
`define HVSYNC_GENERATOR_H

/*
Video sync generator, used to drive a VGA monitor.
Timing from: https://en.wikipedia.org/wiki/Video_Graphics_Array
To use:
- Wire the hsync and vsync signals to top level outputs
- Add a 3-bit (or more) "rgb" output to the top level
*/

module hvsync_generator(clk, reset, hsync, vsync, display_on, hpos, vpos);

  input clk;
  input reset;
  output reg hsync, vsync;
  output display_on;
  output reg [9:0] hpos;
  output reg [9:0] vpos;

  // declarations for TV-simulator sync parameters
  // horizontal constants
  parameter H_DISPLAY       = 640; // horizontal display width
  parameter H_BACK          =  48; // horizontal left border (back porch)
  parameter H_FRONT         =  16; // horizontal right border (front porch)
  parameter H_SYNC          =  96; // horizontal sync width
  // vertical constants
  parameter V_DISPLAY       = 480; // vertical display height
  parameter V_TOP           =  33; // vertical top border
  parameter V_BOTTOM        =  10; // vertical bottom border
  parameter V_SYNC          =   2; // vertical sync # lines
  // derived constants
  parameter H_SYNC_START    = H_DISPLAY + H_FRONT;
  parameter H_SYNC_END      = H_DISPLAY + H_FRONT + H_SYNC - 1;
  parameter H_MAX           = H_DISPLAY + H_BACK + H_FRONT + H_SYNC - 1;
  parameter V_SYNC_START    = V_DISPLAY + V_BOTTOM;
  parameter V_SYNC_END      = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
  parameter V_MAX           = V_DISPLAY + V_TOP + V_BOTTOM + V_SYNC - 1;

  wire hmaxxed = (hpos == H_MAX) || reset;	// set when hpos is maximum
  wire vmaxxed = (vpos == V_MAX) || reset;	// set when vpos is maximum
  
  // horizontal position counter
  always @(posedge clk)
  begin
    hsync <= (hpos>=H_SYNC_START && hpos<=H_SYNC_END);
    if(hmaxxed)
      hpos <= 0;
    else
      hpos <= hpos + 1;
  end

  // vertical position counter
  always @(posedge clk)
  begin
    vsync <= (vpos>=V_SYNC_START && vpos<=V_SYNC_END);
    if(hmaxxed)
      if (vmaxxed)
        vpos <= 0;
      else
        vpos <= vpos + 1;
  end
  
  // display_on is set when beam is in "safe" visible frame
  assign display_on = (hpos<H_DISPLAY) && (vpos<V_DISPLAY);

endmodule

`endif
