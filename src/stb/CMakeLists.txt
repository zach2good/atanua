set(SOURCES
        stb_image_write.c
        stb_image.c)

add_library(stb STATIC ${SOURCES})

target_include_directories(stb PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

link_libraries(stb)
