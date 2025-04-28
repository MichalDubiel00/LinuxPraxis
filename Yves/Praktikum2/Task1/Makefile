# Variables
CXX := g++
AR := ar
CXXFLAGS := -Wall -Wextra -std=c++17
OBJ := main.o hello.o
LIB := libhello_world.a
TARGET := main

# Automatic rules
all: $(TARGET)

$(LIB): hello.o
	$(AR) rcs $@ $^

$(TARGET): main.o $(LIB)
	$(CXX) $(CXXFLAGS) -o $@ main.o -L. -lhello_world

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o $(TARGET) $(LIB)