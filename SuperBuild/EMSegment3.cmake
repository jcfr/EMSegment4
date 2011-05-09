
#
# Fetch the EMSegment3 Package
#


# Sanity checks
if(DEFINED EMS3_DIR AND NOT EXISTS ${EMS3_DIR})
  message(FATAL_ERROR "EMS_DIR variable is defined but corresponds to non-existing directory")
endif()

set(proj EMSegment3)

if(NOT DEFINED EMS3_DIR)
  message(STATUS "Adding external project: ${proj}")
  ExternalProject_Add(${proj}
    # for development, use own git repo
    SVN_REPOSITORY http://svn.slicer.org/Slicer3/trunk/Modules/EMSegment/
    #GIT_REPOSITORY "${git_protocol}://github.com/haehn/EMSegment3.git"
    #GIT_TAG "origin/master"    
    SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${proj}
    BINARY_DIR ${proj}-build
    CMAKE_GENERATOR ${gen}
    CMAKE_ARGS
      ${ep_common_args}
      -DBUILDNAME:STRING=${BUILDNAME}
      -DSITE:STRING=${SITE}
      -DMAKECOMMAND:STRING=${MAKECOMMAND}
      -DCMAKE_BUILD_TYPE:STRING=${build_type}
      -DBUILD_SHARED_LIBS:BOOL=ON
      -DBUILD_EXAMPLES:BOOL=OFF
      -DBUILD_TESTING:BOOL=OFF
      -DBUILD_DOCUMENTATION:BOOL=OFF
      -DCMAKE_CXX_FLAGS:STRING=${ep_common_cxx_flags}
      -DCMAKE_C_FLAGS:STRING=${ep_common_c_flags}
      -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/Install
      # we use Slicer's VTK and ITK
      #-DUSE_SYSTEM_VTK:BOOL=ON
      #-DUSE_SYSTEM_ITK:BOOL=ON
      -DITK_DIR:PATH=${ITK_DIR}
      -DSLICERLIBCURL_DIR:PATH=${SLICERLIBCURL_DIR}
      -DVTK_DIR:PATH=${VTK_DIR}
      -DGIT_EXECUTABLE:FILEPATH=${GIT_EXECUTABLE}
      # Slicer
      -DSlicer_DIR:PATH=${Slicer_DIR}
      -DvtkSlicerVolumesModuleLogic_SOURCE_DIR:PATH=${Slicer_DIR}/../../Slicer4/Modules/Volumes/Logic/
      -DvtkSlicerVolumesModuleLogic_BINARY_DIR:PATH=${Slicer_DIR}/Modules/Volumes/Logic/   
      # Python ? 
      # Tcl ?
      # we use Slicer4
      -DEM_Slicer4_FOUND:BOOL=ON
    INSTALL_COMMAND ""
    DEPENDS 
      ${EMS_DEPENDENCIES}
    )
  set(EMS_DIR ${CMAKE_CURRENT_BINARY_DIR}/${proj}-build)
endif()

