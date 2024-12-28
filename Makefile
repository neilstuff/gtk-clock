CC = gcc
PKGCONFIG = pkg-config
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk4)
LIBS = $(shell $(PKGCONFIG)  --libs gtk4)

SRC = clock.gresource.c clock.c 

OBJS = $(SRC:.c=.o)

all: clock

%.o: %.c
	$(CC) -c -o $(@F) $(CFLAGS) $<

clock: $(OBJS)
	$(CC) -o $(@F) $(OBJS) -mwindows $(LIBS)

clean:
	rm -f $(OBJS)
	rm -f clock
