# Install script for directory: /home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/src/sudoku_fact_generator

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sudoku_fact_generator/msg" TYPE FILE FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/src/sudoku_fact_generator/msg/grid_fact.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sudoku_fact_generator/cmake" TYPE FILE FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/build/sudoku_fact_generator/catkin_generated/installspace/sudoku_fact_generator-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/include/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/share/roseus/ros/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/share/common-lisp/ros/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/share/gennodejs/ros/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/lib/python3/dist-packages/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/devel/lib/python3/dist-packages/sudoku_fact_generator")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/build/sudoku_fact_generator/catkin_generated/installspace/sudoku_fact_generator.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sudoku_fact_generator/cmake" TYPE FILE FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/build/sudoku_fact_generator/catkin_generated/installspace/sudoku_fact_generator-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sudoku_fact_generator/cmake" TYPE FILE FILES
    "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/build/sudoku_fact_generator/catkin_generated/installspace/sudoku_fact_generatorConfig.cmake"
    "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/build/sudoku_fact_generator/catkin_generated/installspace/sudoku_fact_generatorConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sudoku_fact_generator" TYPE FILE FILES "/home/cooper_rosvm13/Documents/University/comp3027RoboticProgramming/assignment/sudoku_bot_ws/src/sudoku_fact_generator/package.xml")
endif()

