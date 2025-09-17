vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jackpoz/arcdps_unofficial_extras_releases
    REF 7711f22a4e8a571809ad1ddec0a1699251d637ca
    SHA512 7e00d4b96324fed04100b840ead4216b5de55c717d6d2f94d5bff48073344227de886bde3948c63ce82afefa4ade50fb2d098f057a14ac058082db803708ca19
    HEAD_REF features/asan-wine
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    magic-enum				ARCPDS_UNOFFICIAL_EXTRAS_MAGIC_ENUM
    cpp11					ARCPDS_UNOFFICIAL_EXTRAS_CPP_11
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsUnofficialExtras)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
