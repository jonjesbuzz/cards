CC = cc
CFLAGS += -O3
LDFLAGS += -I. -L. -l$(NAME)

NAME = cards
OBJECTS = $(patsubst %.c,%.o,$(wildcard *.c))

all: cards lib$(NAME).a

everything: all

$(NAME): main.c lib$(NAME).a
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

$(NAME).o: $(NAME).c

lib$(NAME).a: $(OBJECTS)

%.a:
	ar rcs $@ $?

clean:
	rm -rf $(NAME) $(OBJECTS) lib$(NAME).a
