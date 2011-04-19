#ifndef __qSlicerEMSegment4Module_h
#define __qSlicerEMSegment4Module_h

// CTK includes
#include <ctkPimpl.h>

// SlicerQt includes
#include "qSlicerLoadableModule.h"

#include "qSlicerEMSegment4ModuleExport.h"

class qSlicerEMSegment4ModulePrivate;

/// \ingroup Slicer_QtModules_EMSegment4
class Q_SLICER_QTMODULES_EMSEGMENT4_EXPORT qSlicerEMSegment4Module :
  public qSlicerLoadableModule
{
  Q_OBJECT
  Q_INTERFACES(qSlicerLoadableModule);

public:

  typedef qSlicerLoadableModule Superclass;
  explicit qSlicerEMSegment4Module(QObject *parent=0);
  virtual ~qSlicerEMSegment4Module();

  qSlicerGetTitleMacro(QTMODULE_TITLE);
  
  ///
  /// Activate hidden mode for this module.
  virtual bool isHidden()const;

  ///
  /// Help to use the module
  virtual QString helpText()const;

  ///
  /// Return acknowledgements
  virtual QString acknowledgementText()const;
  
  ///
  /// Return a custom icon for the module
  virtual QIcon icon()const;

protected:
  ///
  /// Initialize the module. Register the volumes reader/writer
  virtual void setup();

  ///
  /// Create and return the widget representation associated to this module
  virtual qSlicerAbstractModuleRepresentation * createWidgetRepresentation();

  ///
  /// Create and return the logic associated to this module
  virtual vtkMRMLAbstractLogic* createLogic();

protected:
  QScopedPointer<qSlicerEMSegment4ModulePrivate> d_ptr;

private:
  Q_DECLARE_PRIVATE(qSlicerEMSegment4Module);
  Q_DISABLE_COPY(qSlicerEMSegment4Module);

};

#endif
