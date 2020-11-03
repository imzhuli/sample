project(test_${libname})


include_directories(
	./include/
	../lib/include/
	)

# source files:
aux_source_directory(./       TEST_SRC)

# dependencies:
set(shared_lib_dependency_private
	${libname}
	${cpp})
set(shared_lib_dependency_public)

#dynamic lib:
add_executable(test_${libname} ${TEST_SRC})
target_link_libraries(test_${libname} PRIVATE ${shared_lib_dependency_private})
set_target_properties(${libname} PROPERTIES VERSION 1.0)
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
else()
	target_compile_features(test_${libname} PRIVATE c_std_11 cxx_std_17)
endif()

add_test(
	NAME                 test_entry
	COMMAND              test_${libname}
	WORKING_DIRECTORY    ${CMAKE_SOURCE_DIR}
	)
