CC = cc

SRCDIR = src
OBJDIR = obj
LIBDIR = lib
INCLUDEDIR = include

CFLAGS += -I$(INCLUDEDIR) -std=c11 -O3 -Wall -Wextra
LDFLAGS += -L$(LIBDIR) -l$(NAME)

NAME = cards

all: cards lib$(NAME).a

$(NAME): $(SRCDIR)/main.c lib$(NAME).a
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

$(OBJDIR)/$(NAME).o: $(SRCDIR)/$(NAME).c | $(OBJDIR)

lib$(NAME).a: $(OBJDIR)/$(NAME).o | $(LIBDIR)

%.a:
	ar rcs $(LIBDIR)/$@ $?

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) $^ -c -o $@

$(OBJDIR):
	mkdir -p $@

$(LIBDIR):
	mkdir -p $@

clean:
	rm -rf $(NAME) $(LIBDIR) $(OBJDIR)
