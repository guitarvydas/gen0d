LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

dev: dc0d.drawio.json clean run

run: gen0d transpile.drawio.json dc0d.drawio.json
	./gen0d dc0d.drawio.json main gen0d.drawio $(LIBSRC)/transpile.drawio

gen0d: gen0d.drawio.json
	odin build . $(ODIN_FLAGS)

gen0d.drawio.json: gen0d.drawio transpile.drawio.json
	$(D2J) gen0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf gen0d gen0d.dSYM


dc0d.drawio.json: ../dc0d/dc0d.drawio
	$(D2J) ../dc0d/dc0d.drawio
