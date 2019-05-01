include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-macro-utils-c

    HEAD_REF vcpkg-patch
)

set(SOURCE_PATH "E:/GitRepos/azure-macro-utils-c")

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH cmake TARGET_PATH share/azure-macro-utils-c)
message("${CURRENT_PACKAGES_DIR}")

file(REMOVE_RECURSE  ${CURRENT_PACKAGES_DIR}/debug)

file(COPY ${SOURCE_PATH}/inc/azure_macro_utils/macro_utils.h DESTINATION ${CURRENT_PACKAGES_DIR}/share/azure-macro-utils-c)

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/azure-macro-utils-c/copyright COPYONLY)

vcpkg_copy_pdbs()

