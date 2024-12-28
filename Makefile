CC = gcc
PKGCONFIG = pkg-config

ifeq ($(OS),Windows_NT)
	DELETE = del
else
	DELETE = rm
endif

COMPILE_RESOURCES = glib-compile-resources
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk4)
LIBS = $(shell $(PKGCONFIG)  --libs gtk4)

SRC = clock.c 
BUILT_SRC = resource.c

OBJS = $(BUILT_SRC:.c=.o) $(SRC:.c=.o)

all: clock

resource.c: clock.gresource.xml clock.ui
	$(COMPILE_RESOURCES) clock.gresource.xml --target=$@ --sourcedir=. --generate-source

%.o: %.c
	$(CC) -c -o $(@F) $(CFLAGS) $<

clock: $(OBJS)
	$(CC) -o $(@F) $(OBJS) -mwindows $(LIBS)

clean:
	$(DELETE) $(OBJS)
	$(DELETE) resource.c
	$(DELETE) clock
