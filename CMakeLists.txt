
# the following is not available yet so it is disabled for now
#
#include( ExternalProject )
#
## Fetch the EMSegment Package
##-----------------------------------------------------------------------------
## Sanity checks
#if(DEFINED EMS_DIR AND NOT EXISTS ${EMS_DIR})
#  message(FATAL_ERROR "EMS_DIR variable is defined but corresponds to non-existing directory")
#endif()
#
#set(proj EMS)
#
## re-define git protocol if necessary
#if(NOT DEFINED git_protocol)
#  set( git_protocol "git")
#endif()
#
#if(NOT DEFINED EMS_DIR)
#  message(STATUS "Adding external project: ${proj}")
#  ExternalProject_Add(${proj}
#    # for development, use own git repo
#    # SVN_REPOSITORY http://svn.slicer.org/Slicer3/trunk/Modules/EMSegment/
#    GIT_REPOSITORY "${git_protocol}://github.com/haehn/EMSegment3.git"
#    GIT_TAG "origin/master"    
#    SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/${proj}
#    BINARY_DIR ${proj}-build
#    CMAKE_GENERATOR ${gen}
#    CMAKE_ARGS
#      ${ep_common_args}
#      -DBUILDNAME:STRING=${BUILDNAME}
#      -DSITE:STRING=${SITE}
#      -DMAKECOMMAND:STRING=${MAKECOMMAND}
#      -DCMAKE_BUILD_TYPE:STRING=${build_type}
#      -DBUILD_SHARED_LIBS:BOOL=ON
#      -DBUILD_EXAMPLES:BOOL=OFF
#      -DBUILD_TESTING:BOOL=OFF
#      -DBUILD_DOCUMENTATION:BOOL=OFF
#      -DCMAKE_CXX_FLAGS:STRING=${ep_common_cxx_flags}
#      -DCMAKE_C_FLAGS:STRING=${ep_common_c_flags}
#      -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/Install
#      # we use Slicer's VTK and ITK
#      -DUSE_SYSTEM_VTK:BOOL=ON
#      -DUSE_SYSTEM_ITK:BOOL=ON
#      -DITK_DIR:PATH=${ITK_DIR}
#      -DVTK_DIR:PATH=${VTK_DIR}
#      -DGIT_EXECUTABLE:FILEPATH=${GIT_EXECUTABLE}      
#      # we use Slicer
#      -DEM_Slicer4_FOUND:BOOL=ON
#      -DSlicer_USE_FILE=${Slicer_USE_FILE}
#      -DSlicer_SOURCE_DIR=${Slicer_SOURCE_DIR}
#    INSTALL_COMMAND ""
#    DEPENDS 
#      ${EMS_DEPENDENCIES}
#    )
#  set(EMS_DIR ${CMAKE_CURRENT_BINARY_DIR}/${proj}-build)
#endif()
## End of EMSegment External
##-----------------------------------------------------------------------------

# temporary solution, include the Slicer3/Modules/EMSegment directory
SET(EM_Slicer4_FOUND ON)
ADD_SUBDIRECTORY(Qt)

# Module name (usually identique to the directory name)
SET(qt_module_name "EMSegment4")

SET(qt_module_export_directive "Q_SLICER_QTMODULES_EMSEGMENT4_EXPORT")

# Additional includes - Current_{source,binary} and Slicer_{Libs,Base} already included
SET(qt_module_include_directories
  )

# Source files
SET(qt_module_SRCS
  qSlicerEMSegment4Module.cxx
  qSlicerEMSegment4Module.h
  )

# Headers that should run through moc
SET(qt_module_MOC_SRCS
  qSlicerEMSegment4Module.h
  )

# UI files
SET(qt_module_UI_SRCS
)

# Additional Target libraries
SET(qt_module_target_libraries
  )

# Resources
SET(qt_module_resources
)

slicerMacroBuildQtModule(
  NAME ${qt_module_name}
  EXPORT_DIRECTIVE ${qt_module_export_directive}
  INCLUDE_DIRECTORIES ${qt_module_include_directories}
  SRCS ${qt_module_SRCS}
  MOC_SRCS ${qt_module_MOC_SRCS}
  UI_SRCS ${qt_module_UI_SRCS}
  TARGET_LIBRARIES ${qt_module_target_libraries}
  RESOURCES ${qt_module_resources}
  )


if(BUILD_TESTING)
  #add_subdirectory(Testing)
endif(BUILD_TESTING)
