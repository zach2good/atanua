set(SOURCES
        angelcodefont.cpp
        mersennetwister.cpp
        toolkit.cpp)

add_library(basecode STATIC ${SOURCES})

target_include_directories(basecode PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(basecode PUBLIC stb glee gl3w)