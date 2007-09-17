#Makefile template for Assignment 3


# GCC Options
CC = gcc
FLAGS = $(WARNINGS) $(DEBUG) $(OPTIMISE)

WARNINGS = -Wall
DEBUG = -g
OPTIMISE =

COMPILE = -c
OUTPUT = -o
# End of GCC Options

# Linker options
LD = gcc
LD_FLAGS = $(WARNINGS) $(DEBUG) $(OPTIMISE)
# End of Linker options


#Source File paths
#Add the full path name to each source under SOURCE_FILES followed by a '\'#

MAIN_FILE = ClassTest.cpp
MAIN_OBJECT = $(MAIN_FILE:.cpp=.o)

SOURCE_FILES = card.cpp
INCLUDES = 
					
				
#Header and Object File paths
HEADER_FILES = $(SOURCE_FILES:.cpp=.h)
OBJECTS = $(SOURCE_FILES:.cpp=.o)
#Header and Object File paths

#Project name:
PROGRAM = app
#Project name
	
#Remove file command#	
RM = rm
#Remove file command#


# Compiles all source files, links them, then uploads to micro#
# Note that linking depends on the library files produced
# So ensure that $(LIB_PATH) is upto date by invoking >'make lib'
all: link
	@echo "Make complete!"

remove:
	@echo Deleting $(PROGRAM) program off server
	$(RM) $(CGI_DIR)/$(PROGRAM)

#Delete all object files
clean:
	@echo "Cleaning up objects and executables" 
	$(RM) $(OBJECTS) $(MAIN_OBJECT)
#clean



# Compile all source files to produce object files #
compile: $(OBJECTS) $(MAIN_OBJECT)

#Compiling the source files	
%.o : %.h %.c $(INCLUDES)
	@echo "Now compiling" $?
	$(CC) $(FLAGS) $(COMPILE) $*.c $(OUTPUT) $@
	
#Compiling the main() file
$(MAIN_OBJECT): $(MAIN_FILE) 
	@echo "Compiling the source file with main()"
	$(CC) $(FLAGS) $(COMPILE) $*.cpp $(OUTPUT) $@

link: $(PROGRAM)
$(PROGRAM): $(OBJECTS) $(MAIN_OBJECT)
	@echo "Linking the object files..."
	$(LD) $(LD_FLAGS) $(MAIN_OBJECT) $(OBJECTS) $(OUTPUT) $(PROGRAM)

copy: $(PROGRAM)
	@echo "Copying cgi-bin file to $(CGI_DIR)"
	scp $(PROGRAM) $(SERVER):$(CGI_DIR)
#	ssh u5 cp $(PROGRAM) $(CGI_DIR)






