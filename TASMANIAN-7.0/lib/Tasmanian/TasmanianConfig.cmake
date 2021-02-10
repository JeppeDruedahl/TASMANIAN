cmake_minimum_required(VERSION 3.10)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was TasmanianConfig.in.cmake                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

# https://cmake.org/cmake/help/v3.5/module/CMakePackageConfigHelpers.html#module:CMakePackageConfigHelpers
# seems to indicate that I need to pre-pend PACKAGE_ to the variable names after the 
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was TasmanianConfig.in.cmake                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

#################################################################################### macro
# but this doesn't seem to work, not sure if this is a "relocatable package" (low concern)
include("C:/TASMANIAN-7.0/lib/Tasmanian/Tasmanian.cmake")

add_executable(Tasmanian::tasgrid IMPORTED)
set_property(TARGET Tasmanian::tasgrid PROPERTY IMPORTED_LOCATION "C:/TASMANIAN-7.0/bin/tasgrid${CMAKE_EXECUTABLE_SUFFIX_CXX}")

add_library(Tasmanian::Tasmanian INTERFACE IMPORTED GLOBAL)

add_library(Tasmanian_libsparsegrid INTERFACE) # for backwards compatibility
add_library(Tasmanian_libdream INTERFACE)

if (TARGET Tasmanian_shared)
    add_library(Tasmanian::shared INTERFACE IMPORTED GLOBAL)
    set_target_properties(Tasmanian::shared PROPERTIES INTERFACE_LINK_LIBRARIES Tasmanian_shared)
    set(Tasmanian_SHARED_FOUND "ON")
endif()

# define _static/_shared independent libraries, default to static if both types are present
if (TARGET Tasmanian_static)
    target_link_libraries(Tasmanian_libsparsegrid INTERFACE Tasmanian_libsparsegrid_static)
    target_link_libraries(Tasmanian_libdream INTERFACE Tasmanian_libdream_static)

    add_library(Tasmanian::static INTERFACE IMPORTED GLOBAL)
    set_target_properties(Tasmanian::static PROPERTIES INTERFACE_LINK_LIBRARIES Tasmanian_static)
    set(Tasmanian_STATIC_FOUND "ON")

    if (OFF)
    # Since Tasmanian does not transitively include <cuda.h> and since all CUDA calls are wrapped in CXX API,
    # projects do not require cuda language to link to Tasmanian; however, CMake adds the extraneous dependence.
    # If Tasmanian was build with CUDA and if the user has not explicitly enabled the CUDA language,
    # then overwrite the CMake generated extraneous CUDA requirements and link with the CXX compiler only.
    # This hack is not necessary when building shared libraries.
        if (NOT CMAKE_CUDA_COMPILER)
            set_target_properties(Tasmanian_libsparsegrid_static PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX")
            set_target_properties(Tasmanian_libsparsegrid_static PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX")
            get_target_property(TasLibs Tasmanian_libsparsegrid_static INTERFACE_LINK_LIBRARIES)
            if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
                set_target_properties(Tasmanian_libsparsegrid_static PROPERTIES INTERFACE_LINK_LIBRARIES "${TasLibs};")
            else()
                set_target_properties(Tasmanian_libsparsegrid_static PROPERTIES INTERFACE_LINK_LIBRARIES "${TasLibs};;dl")
            endif()
        endif()
    endif()
else()
    target_link_libraries(Tasmanian_libsparsegrid INTERFACE Tasmanian_libsparsegrid_shared)
    target_link_libraries(Tasmanian_libdream INTERFACE Tasmanian_libdream_shared)
endif()

if (OFF)
    add_library(Tasmanian_libfortran90 INTERFACE)
    if (TARGET Tasmanian_libfortran90_static)
        target_link_libraries(Tasmanian_libfortran90 INTERFACE Tasmanian_libfortran90_static)
    else()
        target_link_libraries(Tasmanian_libfortran90 INTERFACE Tasmanian_libfortran90_shared)
    endif()
    set(Tasmanian_FORTRAN_FOUND "ON")

    add_library(Tasmanian::Fortran INTERFACE IMPORTED GLOBAL)
    set_target_properties(Tasmanian::Fortran PROPERTIES INTERFACE_LINK_LIBRARIES Tasmanian::Tasmanian)
endif()

# export the python path so other projects can configure python scripts
if (OFF)
    set_and_check(Tasmanian_PYTHONPATH "")
    set(Tasmanian_PYTHON_FOUND "ON")
endif()

# export the MATLAB paths so other projects can write files directly to MATLAB
if (NOT "" STREQUAL "")
    set_and_check(Tasmanian_MATLAB_WORK_FOLDER "")
    set_and_check(Tasmanian_MATLABPATH "C:/TASMANIAN-7.0/share/Tasmanian/matlab/")
    set(Tasmanian_MATLAB_FOUND "ON")
endif()

set(Tasmanian_OPENMP_FOUND "TRUE")
set(Tasmanian_BLAS_FOUND   "FALSE")
set(Tasmanian_MPI_FOUND    "OFF")
set(Tasmanian_CUDA_FOUND   "OFF")
set(Tasmanian_MAGMA_FOUND  "OFF")

# write component info
foreach(_comp ${Tasmanian_FIND_COMPONENTS})
    if (Tasmanian_${_comp}_FOUND)
        message(STATUS "Tasmanian component ${_comp}: found")
    else()
        if (Tasmanian_FIND_REQUIRED_${_comp})
            message(WARNING "Tasmanian rerquired component ${_comp}: missing (error)")
        else()
            message(STATUS "Tasmanian optional component ${_comp}: missing")
        endif()
    endif()
endforeach()
unset(_comp)

check_required_components(Tasmanian)

# if find_package(Tasmanian REQUIRED SHARED) is called without STATIC then default to shared libraries
if ((SHARED IN_LIST Tasmanian_FIND_COMPONENTS) AND (NOT STATIC IN_LIST Tasmanian_FIND_COMPONENTS) AND (TARGET Tasmanian_shared))
    set_target_properties(Tasmanian::Tasmanian PROPERTIES INTERFACE_LINK_LIBRARIES Tasmanian_shared)
else() # otherwise use the default (static if existing, else shared)
    set_target_properties(Tasmanian::Tasmanian PROPERTIES INTERFACE_LINK_LIBRARIES Tasmanian_master)
endif()
