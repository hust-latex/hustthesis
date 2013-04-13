
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

.PHONY:example doc clean reallyclean
