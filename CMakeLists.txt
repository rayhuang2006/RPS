cmake_minimum_required(VERSION 3.10)

project(RPS_Next VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(src/core)

add_executable(RPS_TEST
    src/client/main.cpp
    src/core/BattleEngine.h
)

message(STATUS "RPS-Next Project Configured. Ready to build!")