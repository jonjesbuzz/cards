CXX = clang++

SRCDIR = src
LIBDIR = lib
OBJDIR = obj
INCLUDEDIR = include

CXXFLAGS += -I$(INCLUDEDIR) -O3 -std=c++11 -Wall -Wextra
LDFLAGS += -L$(LIBDIR) -l$(NAME)

NAME = cards

all: cards lib$(NAME).a

$(NAME): $(SRCDIR)/main.cpp lib$(NAME).a
	$(CXX) $(CXXFLAGS) $< -o $@ $(LDFLAGS)

$(OBJDIR)/$(NAME).o: $(SRCDIR)/$(NAME).cpp | $(OBJDIR)

lib$(NAME).a: $(OBJDIR)/$(NAME).o | $(LIBDIR)

%.a:
	ar rcs $(LIBDIR)/$@ $?

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) $^ -c -o $@

$(OBJDIR):
	mkdir -p $@

$(LIBDIR):
	mkdir -p $@

clean:
	rm -rf $(NAME) $(LIBDIR) $(OBJDIR)
