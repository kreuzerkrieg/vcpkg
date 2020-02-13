vcpkg_fail_port_install(ON_TARGET "UWP")

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO zlib-ng/zlib-ng
        REF bd7d2226dde22fbd71477c96654934b0464981cb
        SHA512 d35d614223c7f8ed261a4f28db6201e4c2f128d3a09de6f57a267d0706b7b895a9a5f9bfa8d11b05bd4a92a0c73d3c170cbbb1eb39668c028b3fbc54b027313d
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
