set(SOURCES
        AtanuaConfig.cpp
        basechipfactory.cpp
        BoxStitchingInformation.cpp
        chip.cpp
        cocoadialogs.m
        fileio.cpp
        fileutils.cpp
        main.cpp
        nativefunctions.cpp
        net.cpp
        pin.cpp
        pluginchip.cpp
        pluginchipfactory.cpp
        simutils.cpp
        slidingaverage.cpp
        wire.cpp)

add_executable(atanua ${SOURCES})

target_link_libraries(atanua PUBLIC 8051 basecode chip stb tinyxml2)

target_include_directories(atanua PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_custom_command(TARGET atanua POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
        $<TARGET_FILE:atanua> ${CMAKE_BINARY_DIR})

add_custom_command(TARGET atanua POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/data ${CMAKE_BINARY_DIR}/data)
