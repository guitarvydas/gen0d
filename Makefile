LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

dev-big: clean big-src.json run

dev-test: clean small-src.json run


run: gen0d transpile.drawio.json src.json
	./gen0d src.json main gen0d.drawio $(LIBSRC)/transpile.drawio

gen0d: gen0d.drawio.json
	odin build . $(ODIN_FLAGS)

gen0d.drawio.json: gen0d.drawio transpile.drawio.json
	$(D2J) gen0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf gen0d gen0d.dSYM
	rm -rf src.json dc0d.drawio.json


big-src.json: dc0d.drawio.json
	cp dc0d.drawio.json src.json

small-src.json: small-test.drawio.json
	cp small-test.drawio.json src.json

dc0d.drawio.json: ../dc0d/dc0d.drawio
	$(D2J) ../dc0d/dc0d.drawio

small-test.drawio.json: small-test.drawio
	$(D2J) small-test.drawio
