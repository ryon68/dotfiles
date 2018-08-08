SRCS := \
{{_expr_:join(map(split(glob('*.cpp'),"\n")+split(glob('*.cxx'),"\n"),'"\t".substitute(v:val,"\\","/","g")')," \\\n")}}

OBJS := $(subst .cxx,.o,$(subst .cpp,.o,$(SRCS))) 

# CPPFLAGS := -std=c++14
CPPFLAGS :=
INCLUDE := -I.
LIBS := 
TARGET := {{_expr_:expand('%:p:h:t')}}
ifeq ($(OS),Windows_NT)
TARGET := $(TARGET).exe
endif

.SUFFIXES: .cpp .cxx .o

all : $(TARGET)

$(TARGET) : $(OBJS)
	g++ $(CPPFLAGS) -o $@ $(OBJS) $(LIBS)

.cxx.o :
	g++ $(CPPFLAGS) -c $(INCLUDE) $< -o $@

.cpp.o :
	g++ $(CPPFLAGS) -c $(INCLUDE) $< -o $@

clean :
	rm -f *.o $(TARGET)
