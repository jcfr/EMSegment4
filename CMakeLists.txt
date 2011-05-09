#-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 2.8.2)
#-----------------------------------------------------------------------------

if(POLICY CMP0016)
  CMAKE_POLICY(SET CMP0016 NEW)
endif()
if(POLICY CMP0017)
  CMAKE_POLICY(SET CMP0017 OLD)
endif()

#-----------------------------------------------------------------------------
# Prerequisites
#-----------------------------------------------------------------------------
IF(NOT Slicer_SOURCE_DIR)
  FIND_PACKAGE(Slicer REQUIRED)
  INCLUDE(${Slicer_USE_FILE})
ENDIF()

#-----------------------------------------------------------------------------
# Module name (usually identique to the directory name)
#-----------------------------------------------------------------------------
SET(EXTENSION_NAME EMSegment4)

#-----------------------------------------------------------------------------
# Superbuild Option - Enabled by default
#-----------------------------------------------------------------------------
OPTION(EMSegment4_SUPERBUILD "Build EMSegment4 and the projects it depends on via SuperBuild.cmake." ON)
MARK_AS_ADVANCED(EMSegment4_SUPERBUILD)

#-----------------------------------------------------------------------------
# Additional C/CXX flags
#-----------------------------------------------------------------------------
SET(ADDITIONAL_C_FLAGS "" CACHE STRING "Additional ${EXTENSION_NAME} C Flags")
SET(ADDITIONAL_CXX_FLAGS "" CACHE STRING "Additional ${EXTENSION_NAME} CXX Flags")

#-----------------------------------------------------------------------------
# Superbuild script
#-----------------------------------------------------------------------------
IF(EMSegment4_SUPERBUILD)
  INCLUDE("${CMAKE_CURRENT_SOURCE_DIR}/SuperBuild.cmake")
  RETURN()
ENDIF()

#-----------------------------------------------------------------------------
# Extension description
#-----------------------------------------------------------------------------
SET(EXTENSION_HOMEPAGE "http://www.slicer.org/slicerWiki/index.php/Slicer4:Developers:Projects:QtSlicer/Tutorials/ExtensionWriting")
SET(EXTENSION_CATEGORY "Examples")
SET(EXTENSION_STATUS "Beta")
SET(EXTENSION_DESCRIPTION "This is an example of Qt loadable module built as an extension")

SET(qt_module_export_directive "Q_SLICER_QTMODULES_EMSEGMENT4_EXPORT")

#-----------------------------------------------------------------------------
# Sources
#-----------------------------------------------------------------------------

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

#-----------------------------------------------------------------------------
# Build
#-----------------------------------------------------------------------------
slicerMacroBuildQtModule(
  NAME ${EXTENSION_NAME}
  EXPORT_DIRECTIVE ${qt_module_export_directive}
  INCLUDE_DIRECTORIES ${qt_module_include_directories}
  SRCS ${qt_module_SRCS}
  MOC_SRCS ${qt_module_MOC_SRCS}
  UI_SRCS ${qt_module_UI_SRCS}
  TARGET_LIBRARIES ${qt_module_target_libraries}
  RESOURCES ${qt_module_resources}
  )

#-----------------------------------------------------------------------------
# Generate extension description file '<EXTENSION_NAME>.s4ext'
#-----------------------------------------------------------------------------
IF(NOT Slicer_SOURCE_DIR)
  INCLUDE(SlicerFunctionGenerateExtensionDescription)
  slicerFunctionGenerateExtensionDescription(
    EXTENSION_NAME ${EXTENSION_NAME}
    EXTENSION_CATEGORY ${EXTENSION_CATEGORY} 
    EXTENSION_STATUS ${EXTENSION_STATUS}
    EXTENSION_HOMEPAGE ${EXTENSION_HOMEPAGE}
    EXTENSION_DESCRIPTION ${EXTENSION_DESCRIPTION}
    DESTINATION_DIR ${CMAKE_CURRENT_BINARY_DIR}
    SLICER_WC_REVISION ${Slicer_WC_REVISION}
    SLICER_WC_ROOT ${Slicer_WC_ROOT}
    )
  INCLUDE(${Slicer_EXTENSION_CPACK})
ENDIF()

#-----------------------------------------------------------------------------
# Testing
#-----------------------------------------------------------------------------
if(BUILD_TESTING)
  #add_subdirectory(Testing)
endif()
