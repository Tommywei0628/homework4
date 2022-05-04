VERILOG = iverilog
TARGET = BCD.vcd
TEMP = temp.vvp

$(TARGET) : temp.vvp
	vvp temp.vvp
temp.vvp: BCD_tb.v BCD.v
	$(VERILOG) -o temp.vvp BCD_tb.v BCD.v
clean:
	-del $(TARGET)
	-del $(TEMP)