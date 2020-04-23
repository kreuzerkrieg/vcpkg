vcpkg_fail_port_install(ON_TARGET "UWP")

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO zlib-ng/zlib-ng
        REF 42aa81beafa2ea14cd780a9acf3359a0a09ca44b
        SHA512 6de862a37ee690294e185de6d565c40d2300ab4ab9f71f206b6c36a7f78f9e1792e2c631e129620b5d1d68d3d13fb8235af35ec767893915442544a361f9b00e
        HEAD_REF master
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS
        -DZLIB_COMPAT=OFF
        -DZLIB_ENABLE_TESTS=OFF
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/zlib-ngConfig.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
