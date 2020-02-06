vcpkg_fail_port_install(ON_ARCH "arm" "arm64" ON_TARGET "UWP")
vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL https://git.savannah.gnu.org/git/gsasl.git
        REF c8cfe3e57e08f483056abcdfd37d46c4fe242b13
)

vcpkg_configure_make(
        SOURCE_PATH ${SOURCE_PATH}
        AUTOCONFIG
)

vcpkg_install_make()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/farmhashConfig.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
