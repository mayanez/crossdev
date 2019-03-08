CFLAGS := -Wall -std=c99 -g -fverbose-asm -O0

C_SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(C_SRCS))
TARGETS = $(patsubst %.c,%,$(C_SRCS))

.PHONY: all
all: $(TARGETS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

%: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean
clean:
	rm -rf $(TARGETS)

