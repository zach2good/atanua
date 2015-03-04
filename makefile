all: atanua data

atanua-cpp-src = \
	src/core/AtanuaConfig.cpp \
	src/core/fileio.cpp \
	src/core/BoxStitchingInformation.cpp \
	src/chip/and8chip.cpp \
	src/chip/or8chip.cpp \
	src/chip/nand8chip.cpp \
	src/chip/nor8chip.cpp \
	src/core/slidingaverage.cpp \
	src/chip/switchchip.cpp \
	src/chip/16segchip.cpp \
	src/chip/ledgrid.cpp \
	src/chip/box.cpp \
	src/chip/extpin.cpp \
	src/chip/chip7489.cpp \
	src/chip/audiochip.cpp \
	src/chip/7segchip.cpp \
	src/chip/and3chip.cpp \
	src/chip/andchip.cpp \
	src/basecode/angelcodefont.cpp \
	src/core/basechipfactory.cpp \
	src/chip/buttonchip.cpp \
	src/chip/stepper.cpp \
	src/chip/chip309.cpp \
	src/chip/chip27xx.cpp \
	src/chip/chip74193.cpp \
	src/chip/chip74165.cpp \
	src/chip/chip74192.cpp \
	src/core/chip.cpp \
	src/chip/chip2051.cpp \
	src/chip/chip7400.cpp \
	src/chip/chip7402.cpp \
	src/chip/chip7404.cpp \
	src/chip/chip7408.cpp \
	src/chip/chip7410.cpp \
	src/chip/chip74138.cpp \
	src/chip/chip74139.cpp \
	src/chip/chip74151.cpp \
	src/chip/chip74154.cpp \
	src/chip/chip74163.cpp \
	src/chip/chip74164.cpp \
	src/chip/chip74181.cpp \
	src/chip/chip74191.cpp \
	src/chip/chip74195.cpp \
	src/chip/chip7420.cpp \
	src/chip/chip74240.cpp \
	src/chip/chip74241.cpp \
	src/chip/chip74244.cpp \
	src/chip/chip74245.cpp \
	src/chip/chip74283.cpp \
	src/chip/chip7432.cpp \
	src/chip/chip7447.cpp \
	src/chip/chip74574.cpp \
	src/chip/chip7473.cpp \
	src/chip/chip7474.cpp \
	src/chip/chip7485.cpp \
	src/chip/chip7486.cpp \
	src/chip/chip7490.cpp \
	src/chip/clockchip.cpp \
	src/chip/dchip.cpp \
	src/chip/dflipflop.cpp \
	src/chip/dxchip.cpp \
	src/chip/extrapin.cpp \
	src/core/fileutils.cpp \
	src/chip/jkchip.cpp \
	src/chip/jkflipflop.cpp \
	src/chip/label.cpp \
	src/chip/ledchip.cpp \
	src/chip/logicprobe.cpp \
	src/core/main.cpp \
	src/basecode/mersennetwister.cpp \
	src/chip/muxchip.cpp \
	src/chip/nand3chip.cpp \
	src/chip/nandchip.cpp \
	src/core/nativefunctions.cpp \
	src/core/net.cpp \
	src/chip/nor3chip.cpp \
	src/chip/norchip.cpp \
	src/chip/notchip.cpp \
	src/chip/or3chip.cpp \
	src/chip/orchip.cpp \
	src/core/pin.cpp \
	src/core/pluginchip.cpp \
	src/core/pluginchipfactory.cpp \
	src/chip/sedchip.cpp \
	src/chip/serchip.cpp \
	src/core/simutils.cpp \
	src/chip/srchip.cpp \
	src/chip/srflipflop.cpp \
	src/chip/srnegchip.cpp \
	src/chip/staticlevelchip.cpp \
	src/chip/tchip.cpp \
	src/chip/tflipflop.cpp \
	src/basecode/toolkit.cpp \
	src/core/wire.cpp \
	src/chip/xorchip.cpp \
	src/tinyxml_2_5_3/tinyxml/tinystr.cpp \
	src/tinyxml_2_5_3/tinyxml/tinyxml.cpp \
	src/tinyxml_2_5_3/tinyxml/tinyxmlerror.cpp \
	src/tinyxml_2_5_3/tinyxml/tinyxmlparser.cpp

ifeq ($(shell uname), Darwin)
	atanua-cpp-src += src/core/cocoadialogs.m
endif

atanua-c-src = \
	src/8051/core.c \
	src/8051/disasm.c \
	src/8051/opcodes.c \
	src/stb/stb_image.c \
	src/stb/stb_image_write.c \
	src/glee/GLee.c

atanua-obj = $(atanua-cpp-src:.cpp=.o) $(atanua-c-src:.c=.o)

CXX = clang
CC = clang

PKG_CFLAGS = `pkg-config --cflags gl glu gtk+-3.0 sdl glib-2.0`
PKG_LIBS = `pkg-config --libs gl glu gtk+-3.0 sdl glib-2.0` -lstdc++

#DEBUG = -O3
DEBUG = -O0 -ggdb3 -fno-inline

CXXFLAGS = $(DEBUG) \
		   -stdlib=libstdc++ \
		   -Isrc \
		   -Isrc/include \
		   -Isrc/tinyxml_2_5_3/tinyxml $(PKG_CFLAGS)

ifeq ($(shell uname), Linux)
	PKG_LIBS += -lm -ldl
endif

atanua: $(atanua-obj)
	$(CXX) $(PKG_CFLAGS) -o $@ $(atanua-obj) -L. $(PKG_LIBS) $(CXXFLAGS)

data:
	wget -qc http://sol.gfxile.net/zip/atanua141220.zip
	unzip atanua141220.zip 'data/*'
	rm atanua141220.zip

clean:
	rm -f atanua
	find src -name '*.o' -delete

