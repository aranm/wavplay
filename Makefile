# cxxconf 

TAGS := exctags
PROGRAM := wavplay

.PHONY : all clean
all : $(PROGRAM)
clean :
	rm -f $(PROGRAM) play.o wavplay.o tags $(PROGRAM).3

tags : *.h play.c wavplay.c
	$(TAGS) *.h play.c wavplay.c

man : $(PROGRAM).3
$(PROGRAM).3 : README
	rst2man.py README $(PROGRAM).3

$(PROGRAM) : play.o wavplay.o
	$(CC) $(LDFLAGS) -o wavplay play.o wavplay.o
play.o: play.c wavplay.h
wavplay.o: wavplay.c wavplay.h
