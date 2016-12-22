PWD=$(shell pwd)

INCS=
LIBEDIT_DIR=
DEBUG=-g -ggdb
BASE_FLAGS=$(INCS) $(DEBUG) $(LIBEDIT_DIR) -lrt -lpthread #-fPIC
LDFLAGS=-L.

CC_CFLAGS=$(BASE_FLAGS) #-Wl,-rpath=/usr/local/lib/
CXX_CFLAGS=$(BASE_FLAGS) #-Wl,-rpath=/usr/local/lib/

CC=gcc
CXX=g++

#OBJS=Main.o tinyweb.o tools.o
#SRC=Main.c tinyweb.c tools.c
#HEADERS=tinyweb.h tools.h

#SOLINK=-shared -Xlinker -x


all: tinyweb


tinyweb: tools.o tinyweb.o Main.o  libuv.a
	$(CC) $(CC_CFLAGS) -o tinyweb Main.o tinyweb.o tools.o  libuv.a


libuv.a:
	cp /usr/local/lib/libuv.a ./


%.o: %.c $(HEADERS)
	$(CC) $(CC_CFLAGS) $(CFLAGS) -c $< -o $@

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXX_CFLAGS) $(CXXFLAGS) -c $< -o $@



clean:
	rm -f *.o *.a
