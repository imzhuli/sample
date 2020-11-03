project(lib_${libname})

# enable specific macors by system type:
set(SDL_BUILDING_LIBRARY TRUE)
if (CMAKE_SYSTEM_NAME MATCHES "Windows")
elseif (CMAKE_SYSTEM_NAME MATCHES "Linux")
elseif (CMAKE_SYSTEM_NAME MATCHES "Darwin")
endif()


include_directories(
	./include/
	)
link_directories(
	)


# source files:
aux_source_directory(./src/   SRC)

# dependencies:
set(shared_lib_dependency_private
	${cpp})
set(shared_lib_dependency_public)

#dynamic lib:
add_library(${libname} SHARED ${SRC})
target_link_libraries(${libname} PRIVATE ${shared_lib_dependency_private})
set_target_properties(${libname} PROPERTIES VERSION 1.0)
target_compile_definitions(${libname} PRIVATE -D zec_EXPORT)
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
else()
	target_compile_features(${libname} PRIVATE c_std_11 cxx_std_17)
endif()

#install
install(
	DIRECTORY ${PROJECT_SOURCE_DIR}/./include/${libname}
	DESTINATION include
	FILES_MATCHING REGEX ".+\.(h|hpp)"
	)
install(TARGETS
	# ${libname}
	${libname}
	RUNTIME DESTINATION bin
	ARCHIVE DESTINATION lib
	LIBRARY DESTINATION lib
	)
