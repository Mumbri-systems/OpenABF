## Google Test ##
find_package(GTest REQUIRED)

## Build the tests ##
set(tests
    src/TestHalfEdgeMesh.cpp
    src/TestMath.cpp
    src/TestVec.cpp
    src/TestParameterization.cpp
    src/TestMeshIOUtils.cpp
    src/TestMeshIO.cpp
)

foreach(src ${tests})
    get_filename_component(filename ${src} NAME_WE)
    set(testname OpenABF_${filename})
    add_executable(${testname} ${src})
    target_link_libraries(${testname}
        OpenABF::OpenABF
        GTest::gtest_main
        GTest::gmock_main
    )
    add_test(
        NAME ${testname}
        WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH}
        COMMAND ${testname}
    )
endforeach()