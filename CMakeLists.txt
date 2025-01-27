cmake_minimum_required(VERSION 3.10)
project(Odometer)

# Find FLTK package
find_package(FLTK REQUIRED)

# Add your source files
add_executable(Odometer main.cpp)

# Link FLTK statically
set(FLTK_STATIC ON)
target_link_libraries(Odometer fltk)
