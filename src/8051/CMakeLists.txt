set(SOURCES
        core.c
        disasm.c
        opcodes.c)

add_library(8051 STATIC ${SOURCES})

target_include_directories(8051 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
