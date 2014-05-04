SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)
EXECUTABLES = $(OBJECTS:.o=)
LIBS =-lc

%.o: %.s
	as $< -o $@

default: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
		ld $(LIBS) $$exe.o -o $$exe -dynamic-linker /lib64/ld-linux-x86-64.so.2 ; \
  done

.PHONY: clean
clean:
	rm *.o
	for exe in $(EXECUTABLES) ; do \
    rm $$exe ; \
  done
