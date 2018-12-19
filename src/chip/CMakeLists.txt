file(GLOB SOURCES *.cpp)

add_library(chip STATIC ${SOURCES})

target_include_directories(chip PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(chip PUBLIC stb gl3w 8051)