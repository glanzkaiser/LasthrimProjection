# Thanks beautiful ! for Freya
# Thanks also PB, VP, and all my Learning Guardian
HEADERS = $(shell ls *.h)
SOURCES = $(shell ls *.cpp)

CXXFLAGS = -W -Wall
DEBUGFLAGS = -g
CPPCOMPILER = g++

LFLAGS = 
LIBS = -std=c++11 -lpython3.9

INCLUDES = -I/usr/include/python3.9 -I/usr/lib/python3.9/site-packages/numpy/core/include

OBJS = $(SOURCES:.cpp=.o)

BINARY = main

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $<

all: $(BINARY)

$(BINARY): $(OBJS)
	$(CXX) -o $(BINARY) $(OBJS) $(LFLAGS) $(LIBS)

depend:
	makedepend -f- -- $(SOURCES) > .depend_file

clean:
	rm -rf *.o .depend_file $(BINARY) *~
