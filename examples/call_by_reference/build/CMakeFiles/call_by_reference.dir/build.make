# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.9.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.9.4/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build

# Include any dependencies generated for this target.
include CMakeFiles/call_by_reference.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/call_by_reference.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/call_by_reference.dir/flags.make

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o: CMakeFiles/call_by_reference.dir/flags.make
CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o: ../call_by_reference.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o -c /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/call_by_reference.cpp

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/call_by_reference.dir/call_by_reference.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/call_by_reference.cpp > CMakeFiles/call_by_reference.dir/call_by_reference.cpp.i

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/call_by_reference.dir/call_by_reference.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/call_by_reference.cpp -o CMakeFiles/call_by_reference.dir/call_by_reference.cpp.s

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.requires:

.PHONY : CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.requires

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.provides: CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.requires
	$(MAKE) -f CMakeFiles/call_by_reference.dir/build.make CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.provides.build
.PHONY : CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.provides

CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.provides.build: CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o


# Object files for target call_by_reference
call_by_reference_OBJECTS = \
"CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o"

# External object files for target call_by_reference
call_by_reference_EXTERNAL_OBJECTS =

call_by_reference: CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o
call_by_reference: CMakeFiles/call_by_reference.dir/build.make
call_by_reference: CMakeFiles/call_by_reference.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable call_by_reference"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/call_by_reference.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/call_by_reference.dir/build: call_by_reference

.PHONY : CMakeFiles/call_by_reference.dir/build

CMakeFiles/call_by_reference.dir/requires: CMakeFiles/call_by_reference.dir/call_by_reference.cpp.o.requires

.PHONY : CMakeFiles/call_by_reference.dir/requires

CMakeFiles/call_by_reference.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/call_by_reference.dir/cmake_clean.cmake
.PHONY : CMakeFiles/call_by_reference.dir/clean

CMakeFiles/call_by_reference.dir/depend:
	cd /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build /Users/swapnildevikar/Documents/NPTEL/C++/examples/call_by_reference/build/CMakeFiles/call_by_reference.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/call_by_reference.dir/depend
