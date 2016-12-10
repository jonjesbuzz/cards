CC = clang
CFLAGS += -O3
LDFLAGS += -I. -L. -lcards

all: cards libcards.a

cards: test.c libcards.a
	$(CC) $(LDFLAGS) $^ -o $@

cards.o: cards.c

libcards.a: cards.o
	ar rcs $@ $^

clean:
	rm -rf cards cards.o libcards.a