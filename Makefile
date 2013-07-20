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

all:unpack example doc
example:example-zh example-en

unpack:FORCE
	make -C ./hustthesis unpack

example-zh ./hustthesis/hustthesis-zh-example.pdf:
	make -C ./hustthesis example-zh

example-en ./hustthesis/hustthesis-en-example.pdf:
	make -C ./hustthesis example-en

doc ./hustthesis/hustthesis.pdf:
	make -C ./hustthesis doc

clean:
	make -C ./hustthesis clean

reallyclean:
	make -C ./hustthesis reallyclean

install:unpack ./hustthesis/hustthesis-zh-example.pdf ./hustthesis/hustthesis-en-example.pdf ./hustthesis/hustthesis.pdf
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

checksum:FORCE
	make -C ./hustthesis checksum

FORCE:
.PHONY:all unpack example example-zh example-en doc install uninstall clean reallyclean checksum FORCE
