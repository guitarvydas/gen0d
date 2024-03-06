LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

all: dev-big

dev-rest: clean rest-src.json run

dev-small: clean small-src.json run

dev-big: clean big-src.json run

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
	rm -rf src.json dc0d.drawio.json small-src.json big-src.json rest-src.json
	rm -rf rest-test.drawio.json small-test.drawio.json


big-src.json: dc0d.drawio.json
	cp dc0d.drawio.json src.json

dc0d.drawio.json: ../dc0d/dc0d.drawio
	$(D2J) ../dc0d/dc0d.drawio

small-src.json: small-test.drawio.json
	cp small-test.drawio.json src.json

small-test.drawio.json: small-test.drawio
	$(D2J) small-test.drawio

rest-src.json: rest-test.drawio.json
	cp rest-test.drawio.json src.json

rest-test.drawio.json: rest-test.drawio
	$(D2J) rest-test.drawio
