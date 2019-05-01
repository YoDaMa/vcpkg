include(vcpkg_common_functions)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

# file(COPY ${SOURCE_PATH}/inc/azure_macro_utils/macro_utils.h DESTINATION ${CURRENT_PACKAGES_DIR}/share/azure-c-shared-utility)
# file(COPY ${CURRENT_INSTALLED_DIR}/share/azure-macro-utils-c/macro_utils.h DESTINATION ${SOURCE_PATH}/deps/azure-c-shared-utility/configs/)

set(SOURCE_PATH "E:/GitRepos/azure-c-shared-utility")

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -Dskip_samples=ON
        -Duse_installed_dependencies=ON
        -Duse_default_uuid=ON
        -Dbuild_as_dynamic=OFF
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH cmake TARGET_PATH share/azure_c_shared_utility)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${SOURCE_PATH}/configs/azure_iot_build_rules.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/azure-c-shared-utility)

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/azure-c-shared-utility/copyright COPYONLY)

vcpkg_copy_pdbs()

