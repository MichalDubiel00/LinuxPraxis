CC := g++
CFLAGS :=  
LDLIBS := lstdc++

# Targets

LIB = libhello.a
MAIN = main
OBJS = hello.o main.o

all: $(LIB) $(MAIN)

$(LIB): hello.o
	ar rcs $@ $^
$(MAIN) : main.o $(LIB)
	$(CC) $(CFLAGS) -o $@ main.o -L. -lhello
clean:
	rm -f *.o $(LIB) $(MAIN)
run: all
	./$(MAIN)