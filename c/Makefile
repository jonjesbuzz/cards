CC = cc
CFLAGS += -O3
LDFLAGS += -I. -L. -l$(LIBNAME)

NAME = cards
OBJECTS = $(patsubst %.c,%.o,$(wildcard *.c))

all: cards lib$(NAME).a

everything: all

$(NAME): main.c lib$(NAME).a

$(NAME).o: $(NAME).c

lib$(NAME).a: $(OBJECTS)

%.a:
	ar rcs $@ $?

clean:
	rm -rf $(NAME) $(NAME).o main.o lib$(NAME).a
