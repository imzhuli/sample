project(test_${libname})

include_directories(
	./include/
	../lib/include/
	)
link_directories(
	)

set(game_dependency ${libname} ${cpp})


aux_source_directory(./      GAME_LOGIC_SRC)
add_executable(game          ${GAME_LOGIC_SRC})
target_link_libraries(game   ${game_dependency})


if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
else()
	target_compile_features(game PRIVATE c_std_11 cxx_std_17)
endif()

