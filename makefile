DEBUG=NONE # CSTSOLVER

DBGDFLAGS = -g -I../../../esdl/src -I../../../euvm/src -L-L../../../build -L-R../../../build -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-debug-shared -L-ldruntime-ldc-debug-shared -d-debug=$(DEBUG) # -d-debug=CSTPARSER

DFLAGS = -I../../../esdl/src -I../../../euvm/src -L-L../../../build -L-R../../../build -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -d-debug=$(DEBUG) # -d-debug=CSTPARSER

DBGDECKFLAGS = -d-version=DECK -g -I../../../esdl/src -I../../../euvm/src -L-L../../../build-deck -L-R../../../build-deck -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -d-debug=$(DEBUG) # -d-debug=CSTPARSER

DECKFLAGS = -d-version=DECK -I../../../esdl/src -I../../../euvm/src -L-L../../../build-deck -L-R../../../build-deck -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -d-debug=$(DEBUG) # -d-debug=CSTPARSER



# DFLAGS = -I../../../esdl/src -I../../../euvm/src -L-L../../../build -L-R../../../build -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -d-debug=$(DEBUG) # -d-debug=CSTSOLVER

LDC2 = ldc2

clean:
	rm -rf *.exe *.o *~ results/testruns/logs/*

%.exe : %.d
	@ $(LDC2) $^ $(DFLAGS) -relocation-model=pic -of$@
	@ $(LDC2) $^ $(DBGDFLAGS) -relocation-model=pic -ofdebug_$@
# @ $(LDC2) $^ $(DECKFLAGS) -relocation-model=pic -ofdeck_$@
# @ $(LDC2) $^ $(DBGDECKFLAGS) -relocation-model=pic -ofdeck_debug_$@
