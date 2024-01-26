LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

dev: clean run

run: gen0d transpile.drawio.json
	./gen0d main gen0d.drawio $(LIBSRC)/transpile.drawio

gen0d: gen0d.drawio.json
	odin build . $(ODIN_FLAGS)

gen0d.drawio.json: gen0d.drawio transpile.drawio.json
	$(D2J) gen0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf gen0d gen0d.dSYM
