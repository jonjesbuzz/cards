CC = clang
CFLAGS += -O3
LDFLAGS += -I. -L. -lcards

all: cards libcards.a

swift: cards-swift Cards.swiftmodule

everything: all swift

cards: main.c libcards.a
	$(CC) $(LDFLAGS) $^ -o $@

cards.o: cards.c

libcards.a: cards.o
	ar rcs $@ $^

Cards.swiftmodule: cards.swift
	swiftc -emit-module -module-name Cards $^

cards-swift: cards.swift main.swift
	swiftc $^ -o $@

clean:
	rm -rf cards *.o *.a cards-swift Cards.swiftmodule cards.swiftdoc