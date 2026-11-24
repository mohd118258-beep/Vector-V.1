module riscv_tb;

    reg sync_clk;
    reg set_zero;

    wire [31:0] pc_out;
    wire [31:0] instruction_out;
    wire [31:0] alu_result_out;

    integer err_count = 0;

    Riscv_top DUT (
        .clk(sync_clk),
        .reset(set_zero),
        .pc_out(pc_out),
        .instruction_out(instruction_out),
        .alu_result_out(alu_result_out)
    );

    always #5 sync_clk = ~sync_clk;

    initial begin
        sync_clk = 0;
        set_zero = 1;

        #10 set_zero = 0;

        #3;
        if (alu_result_out !== 32'd14) begin
            $display("[FAIL] Test 1 (add): Expected 14, Got %0d", alu_result_out);
            err_count = err_count + 1;
        end else
            $display("[PASS] Test 1 (add): Got %0d", alu_result_out);

        #10;
        if (alu_result_out !== 32'd6) begin
            $display("[FAIL] Test 2 (sub): Expected 6, Got %0d", alu_result_out);
            err_count = err_count + 1;
        end else
            $display("[PASS] Test 2 (sub): Got %0d", alu_result_out);

        #10;
        if (alu_result_out !== 32'd14) begin
            $display("[FAIL] Test 3 (write x0): Expected ALU=14, Got %0d", alu_result_out);
            err_count = err_count + 1;
        end else
            $display("[PASS] Test 3 (write x0 attempt): ALU computed %0d", alu_result_out);

        #10;
        if ($signed(alu_result_out) !== -32'sd10) begin
            $display("[FAIL] Test 4 (negative sub): Expected -10, Got %0d", $signed(alu_result_out));
            err_count = err_count + 1;
        end else
            $display("[PASS] Test 4 (negative sub): Got %0d", $signed(alu_result_out));

        #10;
        if (alu_result_out !== 32'd4) begin
            $display("[FAIL] Test 5 (x0 protection): Expected 4, Got %0d (x0 was overwritten!)", alu_result_out);
            err_count = err_count + 1;
        end else
            $display("[PASS] Test 5 (x0 protection): x0 stayed 0, Got %0d", alu_result_out);

        #7;
        if (err_count == 0)
            $display("=========================================\nALL STRESS TESTS PASSED! (0 Errors)\n=========================================");
        else
            $display("=========================================\nTEST FAILED with %0d error(s)!\n=========================================", err_count);

        $stop;
    end

endmodule 