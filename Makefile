# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

all:example doc

example:
	make -C ./example

doc:
	make -C ./doc

clean:
	make -C ./example clean
	make -C ./doc clean

reallyclean:
	make -C ./example reallyclean
	make -C ./doc reallyclean

install:example all
ifeq ($(OS_TYPE),Windows)
	./install/win32.bat install
else
	./install/unix.sh install
endif

uninstall:
ifeq ($(OS_TYPE),Windows)
	./install/win32.bat uninstall
else
	./install/unix.sh uninstall
endif

.PHONY:all example doc install uninstall clean reallyclean
