SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)
EXECUTABLES = $(OBJECTS:.o=)
LIBS =-lc
BIN_DIR = ../bin
OBJ_DIR = ../bin/obj

%.o: %.s directories
	as $< -o $(OBJ_DIR)/$@

all: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
		ld $(LIBS) $(OBJ_DIR)/$$exe.o -o $(BIN_DIR)/$$exe.bin -dynamic-linker /lib64/ld-linux-x86-64.so.2 ; \
  done

.PHONY: clean directories
directories: $(OBJ_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm $(BIN_DIR)/*.o -f
	for exe in $(EXECUTABLES) ; do \
    rm $(BIN_DIR)/$$exe.bin -f; \
  done
