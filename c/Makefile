CC = cc
CFLAGS += -O3
LDFLAGS += -I. -L. -lcards

all: cards libcards.a

everything: all

cards: main.c libcards.a
	$(CC) $(LDFLAGS) $^ -o $@

cards.o: cards.c

libcards.a: cards.o
	ar rcs $@ $^

clean:
	rm -rf cards *.o *.a cards-swift $(SWIFTMODULE).swiftmodule cards.swiftdoc
