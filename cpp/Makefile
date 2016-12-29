CXX = clang++
CXXFLAGS += -O3 -std=c++11
LDFLAGS += -I. -L. -l$(NAME)

NAME = cards
OBJECTS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))

all: cards lib$(NAME).a

everything: all

$(NAME): main.cpp lib$(NAME).a
	$(CXX) $(CFLAGS) $(LDFLAGS) $< -o $@

$(NAME).o: $(NAME).cpp

lib$(NAME).a: $(OBJECTS)

%.a:
	ar rcs $@ $?

clean:
	rm -rf $(NAME) $(OBJECTS) lib$(NAME).a
