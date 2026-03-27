cmake_minimum_required(VERSION 3.10)
project(RPS_Next VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_POLICY_DEFAULT_CMP0135 NEW)

include(FetchContent)
FetchContent_Declare(
    json
    URL https://github.com/nlohmann/json/releases/download/v3.11.2/include.zip
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)


FetchContent_GetProperties(json)
if(NOT json_POPULATED)
    FetchContent_Populate(json)
    add_library(nlohmann_json INTERFACE)
    add_library(nlohmann_json::nlohmann_json ALIAS nlohmann_json)
    target_include_directories(nlohmann_json INTERFACE ${json_SOURCE_DIR}/include)
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(
    src/core
    src/common)

add_executable(RPS_TEST
    src/client/main.cpp
    src/core/BattleEngine.h
    src/core/BattleManager.h
    src/core/Card.h
    src/common/Types.h
)

target_link_libraries(RPS_TEST PRIVATE nlohmann_json)