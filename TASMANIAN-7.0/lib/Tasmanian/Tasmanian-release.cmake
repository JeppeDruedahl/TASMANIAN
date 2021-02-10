#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Tasmanian_libsparsegrid_static" for configuration "Release"
set_property(TARGET Tasmanian_libsparsegrid_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Tasmanian_libsparsegrid_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/tasmaniansparsegrid_static.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Tasmanian_libsparsegrid_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_Tasmanian_libsparsegrid_static "${_IMPORT_PREFIX}/lib/tasmaniansparsegrid_static.lib" )

# Import target "Tasmanian_libsparsegrid_shared" for configuration "Release"
set_property(TARGET Tasmanian_libsparsegrid_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Tasmanian_libsparsegrid_shared PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/tasmaniansparsegrid.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/tasmaniansparsegrid.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS Tasmanian_libsparsegrid_shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_Tasmanian_libsparsegrid_shared "${_IMPORT_PREFIX}/lib/tasmaniansparsegrid.lib" "${_IMPORT_PREFIX}/bin/tasmaniansparsegrid.dll" )

# Import target "Tasmanian_tasgrid" for configuration "Release"
set_property(TARGET Tasmanian_tasgrid APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Tasmanian_tasgrid PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/tasgrid.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS Tasmanian_tasgrid )
list(APPEND _IMPORT_CHECK_FILES_FOR_Tasmanian_tasgrid "${_IMPORT_PREFIX}/bin/tasgrid.exe" )

# Import target "Tasmanian_libdream_static" for configuration "Release"
set_property(TARGET Tasmanian_libdream_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Tasmanian_libdream_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/tasmaniandream_static.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Tasmanian_libdream_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_Tasmanian_libdream_static "${_IMPORT_PREFIX}/lib/tasmaniandream_static.lib" )

# Import target "Tasmanian_libdream_shared" for configuration "Release"
set_property(TARGET Tasmanian_libdream_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Tasmanian_libdream_shared PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/tasmaniandream.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/tasmaniandream.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS Tasmanian_libdream_shared )
list(APPEND _IMPORT_CHECK_FILES_FOR_Tasmanian_libdream_shared "${_IMPORT_PREFIX}/lib/tasmaniandream.lib" "${_IMPORT_PREFIX}/bin/tasmaniandream.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
