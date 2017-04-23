TARGET := md2

OBJ := $(TARGET)_main.o $(TARGET).o

ASFLAGS = -mcpu=xscale -alh=$*.lis -L
CFLAGS = -mcpu=xscale -O0 -Wall
LDFLAGS = -static -L /usr/arm-linux-gnueabi

CC := arm-linux-gnueabi-gcc
AS := arm-linux-gnueabi-as

.PHONY: test all clean distclean

test:	all
	qemu-arm $(TARGET) < mx23.txt


all:	$(TARGET)

clean:
	$(RM) $(TARGET) *.o

distclean:	clean
	$(RM) *.lis *~

allhfiles := $(wildcard *.h)

$(TARGET):	$(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o:	%.s
	$(AS) -g $(ASFLAGS) -o $@ $<

%.o:	%.c $(allhfiles)
	$(CC) -g $(CFLAGS) -o $@ -c $<

%.s:	%.c $(allhfiles)
	$(CC) $(CFLAGS) -fomit-frame-pointer -o $@ -S $<
