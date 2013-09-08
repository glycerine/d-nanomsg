
NANO_SRC_DIR := /usr/cn/nanomsg/src
RUSTBINDGEN := /usr/cn/rust-bindgen/bindgen

NANO_HEADERS := \
$(NANO_SRC_DIR)/nn.h \
$(NANO_SRC_DIR)/pair.h \
$(NANO_SRC_DIR)/pubsub.h \
$(NANO_SRC_DIR)/tcp.h


all:  cnano

clean:
	rm -f nanocli nanoserv clinano servnano

cnano:
	gcc -g -o clinano clinano.c -lnanomsg -I${NANO_SRC_DIR}
	gcc -g -o servnano servnano.c -lnanomsg -I${NANO_SRC_DIR}

dnano:
	gcc -g -o clinano clinano.d -lnanomsg -I${NANO_SRC_DIR}
	gcc -g -o servnano servnano.d -lnanomsg -I${NANO_SRC_DIR}

