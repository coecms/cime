find_path(
    NetCDF_C_INCLUDE_DIR
    netcdf.h
    PATHS $ENV{NETCDF_ROOT}/include
    NO_DEFAULT_PATH
    )

find_library(
    NetCDF_C_LIBRARY
    netcdf
    PATHS $ENV{NETCDF_ROOT}/lib
    NO_DEFAULT_PATH
    )

find_path(
    NetCDF_Fortran_INCLUDE_DIR
    netcdf.mod
    PATHS $ENV{NETCDF_ROOT}/include/Intel
    NO_DEFAULT_PATH
    )

find_library(
    NetCDF_Fortran_LIBRARY
    netcdff
    PATHS $ENV{NETCDF_ROOT}/lib/Intel
    NO_DEFAULT_PATH
    )

set(NetCDF_VERSION $ENV{NETCDF_VERSION})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NetCDF_C
    FOUND_VAR NetCDF_C_FOUND
    REQUIRED_VARS
        NetCDF_C_LIBRARY
        NetCDF_C_INCLUDE_DIR
    VERSION_VAR NetCDF_VERSION
    )
find_package_handle_standard_args(NetCDF_Fortran
    FOUND_VAR NetCDF_Fortran_FOUND
    REQUIRED_VARS
        NetCDF_Fortran_LIBRARY
        NetCDF_Fortran_INCLUDE_DIR
    VERSION_VAR NetCDF_VERSION
    )

if (NetCDF_C_FOUND)
    set(NetCDF_C_LIBRARIES ${NetCDF_C_LIBRARY})
    set(NetCDF_C_INCLUDE_DIRS ${NetCDF_C_INCLUDE_DIR})
endif()
if (NetCDF_Fortran_FOUND)
    set(NetCDF_Fortran_LIBRARIES ${NetCDF_Fortran_LIBRARY})
    set(NetCDF_Fortran_INCLUDE_DIRS ${NetCDF_Fortran_INCLUDE_DIR})
endif()
