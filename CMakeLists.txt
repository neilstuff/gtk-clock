add_executable(clock)
cmake_minimum_required(VERSION 3.18)
project(ProjectClock LANGUAGES C)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK4 REQUIRED IMPORTED_TARGET gtk4)

add_executable(ProjectClock clock.c)
target_link_libraries(ProjectClock PRIVATE PkgConfig::GTK4)