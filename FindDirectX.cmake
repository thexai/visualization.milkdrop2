

if(WIN32) # The only platform it makes sense to check for DirectX SDK
  find_path(DirectX_INCLUDE_DIR d3d9.h
            "$ENV{DXSDK_DIR}/Include")
  mark_as_advanced(DirectX_INCLUDE_DIR)
  if(DirectX_INCLUDE_DIR)
    set(DirectX_ROOT_DIR "${DirectX_INCLUDE_DIR}/..") 
  endif(DirectX_INCLUDE_DIR)

  # dlls are in DirectX_ROOT_DIR/Developer Runtime/x64|x86
  # lib files are in DirectX_ROOT_DIR/Lib/x64|x86

  set(DirectX_LIBRARY_PATHS)
  if(CMAKE_CL_64)
    set(DirectX_LIBRARY_PATHS 
      "${DirectX_ROOT_DIR}/Lib/x64")
  else(CMAKE_CL_64)
    set(DirectX_LIBRARY_PATHS 
      "${DirectX_ROOT_DIR}/Lib/x86" "${DirectX_ROOT_DIR}/Lib")
  endif(CMAKE_CL_64)

  find_library(DirectX_LIBRARY d3d9 ${DirectX_LIBRARY_PATHS} NO_DEFAULT_PATH)
  if(DirectX_INCLUDE_DIR AND DirectX_LIBRARY)
    set(DirectX_FOUND true)
  endif(DirectX_INCLUDE_DIR AND DirectX_LIBRARY)
  mark_as_advanced(DirectX_LIBRARY)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(DirectX DEFAULT_MSG ${DirectX_INCLUDE_DIR} ${DirectX_LIBRARY})
endif(WIN32)
