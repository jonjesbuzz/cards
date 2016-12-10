CC = clang
CFLAGS += -O3
LDFLAGS += -I. -L. -lcards

all: cards libcards.a

everything: all cards-swift

cards: main.c libcards.a
	$(CC) $(LDFLAGS) $^ -o $@

cards.o: cards.c

libcards.a: cards.o
	ar rcs $@ $^

cards-swift: main.swift cards.swift
	swiftc $^ -o $@

clean:
	rm -rf cards cards.o libcards.a cards-swift