
#-----------------------------------------------------------------------------
# Git protocole option
#-----------------------------------------------------------------------------
option(Slicer_USE_GIT_PROTOCOL "If behind a firewall turn this off to use http instead." ON)

set(git_protocol "git")
if(NOT Slicer_USE_GIT_PROTOCOL)
  set(git_protocol "http")
endif()

#-----------------------------------------------------------------------------
# Enable and setup External project global properties
#-----------------------------------------------------------------------------
INCLUDE(ExternalProject)

set(ep_base        "${CMAKE_BINARY_DIR}")
SET(ep_common_args
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  #-DBUILD_TESTING:BOOL=OFF
  )
  
  
# Compute -G arg for configuring external projects with the same CMake generator:
if(CMAKE_EXTRA_GENERATOR)
  set(gen "${CMAKE_EXTRA_GENERATOR} - ${CMAKE_GENERATOR}")
else()
  set(gen "${CMAKE_GENERATOR}")
endif()

#-----------------------------------------------------------------------------
# EMSegment4 dependencies
#-----------------------------------------------------------------------------
set(EMS_DEPENDENCIES)
include(SuperBuild/EMSegment3.cmake)

#-----------------------------------------------------------------------------
# Configure and build EMSegment4
#------------------------------------------------------------------------------

set(EMSegment4_DEPENDENCIES EMSegment3)

set(proj EMSegment4)
ExternalProject_Add(${proj}
  DOWNLOAD_COMMAND ""
  INSTALL_COMMAND ""
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  BINARY_DIR ${proj}-build
  CMAKE_GENERATOR ${gen}
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
    -DADDITIONAL_C_FLAGS:STRING=${ADDITIONAL_C_FLAGS}
    -DADDITIONAL_CXX_FLAGS:STRING=${ADDITIONAL_CXX_FLAGS}
    -DSubversion_SVN_EXECUTABLE:FILEPATH=${Subversion_SVN_EXECUTABLE}
    -DGIT_EXECUTABLE:FILEPATH=${GIT_EXECUTABLE}
    -D${proj}_SUPERBUILD:BOOL=OFF
    #-DCTEST_CONFIGURATION_TYPE:STRING=${CTEST_CONFIGURATION_TYPE}
    # Slicer
    -DSlicer_DIR:PATH=${Slicer_DIR}
  DEPENDS 
    ${EMSegment4_DEPENDENCIES}
  )
  
