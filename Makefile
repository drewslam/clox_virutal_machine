# Compiler and compiler flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c23 -Iinclude -g

# Project details
TARGET = main           
SRC_DIR = src
BUILD_DIR = build
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC))

# Default rule - compile the target executable
all: $(BUILD_DIR) $(TARGET)

# Linking object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Rule for compiling .c files into .o files, placing them in the build directory
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Ensure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean up object files and the executable
clean:
	rm -rf $(BUILD_DIR) $(TARGET)

# Phony targets to avoid conflicts with files named "all" or "clean"
.PHONY: all clean

