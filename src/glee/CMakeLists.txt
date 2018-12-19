set(SOURCES
        GLee.c)

add_library(glee STATIC ${SOURCES})

target_include_directories(glee PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
