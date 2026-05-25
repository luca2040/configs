cmake_minimum_required(VERSION 3.10)

project(main C)

set(CMAKE_C_STANDARD 17)

add_executable(main main.c)

target_compile_options(main PRIVATE
    -Wall
    -Wextra
    -Wpedantic
)

