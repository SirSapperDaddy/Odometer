# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sapper/Desktop/Odometer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sapper/Desktop/Odometer/build

# Include any dependencies generated for this target.
include CMakeFiles/Odometer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Odometer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Odometer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Odometer.dir/flags.make

CMakeFiles/Odometer.dir/main.cpp.o: CMakeFiles/Odometer.dir/flags.make
CMakeFiles/Odometer.dir/main.cpp.o: ../main.cpp
CMakeFiles/Odometer.dir/main.cpp.o: CMakeFiles/Odometer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sapper/Desktop/Odometer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Odometer.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Odometer.dir/main.cpp.o -MF CMakeFiles/Odometer.dir/main.cpp.o.d -o CMakeFiles/Odometer.dir/main.cpp.o -c /home/sapper/Desktop/Odometer/main.cpp

CMakeFiles/Odometer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Odometer.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sapper/Desktop/Odometer/main.cpp > CMakeFiles/Odometer.dir/main.cpp.i

CMakeFiles/Odometer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Odometer.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sapper/Desktop/Odometer/main.cpp -o CMakeFiles/Odometer.dir/main.cpp.s

# Object files for target Odometer
Odometer_OBJECTS = \
"CMakeFiles/Odometer.dir/main.cpp.o"

# External object files for target Odometer
Odometer_EXTERNAL_OBJECTS =

Odometer: CMakeFiles/Odometer.dir/main.cpp.o
Odometer: CMakeFiles/Odometer.dir/build.make
Odometer: /usr/lib/x86_64-linux-gnu/libfltk.so
Odometer: CMakeFiles/Odometer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sapper/Desktop/Odometer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Odometer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Odometer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Odometer.dir/build: Odometer
.PHONY : CMakeFiles/Odometer.dir/build

CMakeFiles/Odometer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Odometer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Odometer.dir/clean

CMakeFiles/Odometer.dir/depend:
	cd /home/sapper/Desktop/Odometer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sapper/Desktop/Odometer /home/sapper/Desktop/Odometer /home/sapper/Desktop/Odometer/build /home/sapper/Desktop/Odometer/build /home/sapper/Desktop/Odometer/build/CMakeFiles/Odometer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Odometer.dir/depend

