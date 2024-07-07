# Compiler
CC = clang

# Compiler flags
CFLAGS = -Iinclude -Wall -Wextra -std=c11
DEPFLAGS = -MMD -MP

# Target executable
TARGET = main

# Source files (use wildcard to include all .c files in src/)
SRCS = $(wildcard src/*.c)

# Object files
OBJS = $(SRCS:.c=.o)

# Dependency files
DEPS = $(SRCS:.c=.d)

# Default target
all: $(TARGET)

# Linking the target executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# Compiling source files to object files and generating dependencies
src/%.o: src/%.c
	$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

# Include dependency files
-include $(DEPS)

# Clean up
clean:
	rm -f $(OBJS) $(TARGET) $(DEPS)

# Phony targets
.PHONY: all clean

