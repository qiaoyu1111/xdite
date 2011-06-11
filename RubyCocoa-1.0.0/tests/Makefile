TARGETS = objc_test.bundle objc_proto.bundle
OBJS = objc_test.o objc_proto.o
CFLAGS = -fno-common -g -fobjc-exceptions -Wall -arch ppc -arch i386 -arch x86_64 -DRB_ID=ID -I/usr/include/libxml2 -DHAS_LIBXML2  -I/usr/include/ffi  -DMACOSX 

.SUFFIXES: .bundle
.o.bundle:
	cc -o $@ ${CFLAGS} -bundle -framework Foundation -framework AddressBook $<

all: ${TARGETS}

clean:
	rm -f ${TARGETS} ${OBJS}
