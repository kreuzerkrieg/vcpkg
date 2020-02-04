include(vcpkg_common_functions)

if (NOT VCPKG_CMAKE_SYSTEM_NAME)
    set(EXEC_ENV "Windows")
else ()
    set(EXEC_ENV "${VCPKG_CMAKE_SYSTEM_NAME}")
endif ()

if (NOT EXEC_ENV STREQUAL "Linux")
    message(FATAL_ERROR "ProjectName Super Duper Library currently only supports Linux platforms")
    message(STATUS "Please consider creating a port for Windows")
endif ()

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO powturbo/Turbo-Base64
        REF master
        SHA512 066d63be9b6cbe08e21aa7e59a721abd671e67937ed7af3a2ec8eafb6606173097c6364d239a5b708159bbfed758757ffebb69035384fa623963bcf0664c7d6c
        HEAD_REF master
)

vcpkg_configure_cmake(
        SOURCE_PATH ${CMAKE_CURRENT_LIST_DIR}
        PREFER_NINJA
        OPTIONS
        -DSOURCE_PATH=${SOURCE_PATH}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

vcpkg_test_cmake(PACKAGE_NAME ${PORT})
