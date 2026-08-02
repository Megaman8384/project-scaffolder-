CXX = g++

CXXFLAGS = -Wall -std=c++23 -Iinclude -I/opt/homebrew/include

LDFLAGS = -L/opt/homebrew/lib -lraylib \
          -framework OpenGL \
          -framework Cocoa \
          -framework IOKit \
          -framework CoreVideo

TARGET = main

SRC = $(shell find src -name "*.cpp")

all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

run: all
	./$(TARGET)

clean:
	rm -f $(TARGET)