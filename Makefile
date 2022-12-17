rtl = ./rtl/sequencer.v
tb = ./tb/test.v
sf = ./tb/shift_reg.v

all: com sim

com:
	vcs -full64  -debug_all $(tb) $(sf) $(rtl) -l com.log 
	#vcs -full64  -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed -sverilog -fsdb -debug_all $(tb) $(sf) $(rtl) -l com.log
sim:
	./simv -l sim.log

run:
	dve -vpd vcdplus.vpd &

clean:
	rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb verdi* *.out *.conf *.fsdb