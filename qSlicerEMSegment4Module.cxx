
// Qt includes
#include <QtPlugin>

// EMSegment4 includes
#include "qSlicerEMSegment4Module.h"

//-----------------------------------------------------------------------------
Q_EXPORT_PLUGIN2(qSlicerEMSegment4Module, qSlicerEMSegment4Module);

//-----------------------------------------------------------------------------
/// \ingroup Slicer_QtModules_EMSegment4
class qSlicerEMSegment4ModulePrivate
{
public:
  qSlicerEMSegment4ModulePrivate();
};

//-----------------------------------------------------------------------------
// qSlicerEMSegment4ModulePrivate methods

//-----------------------------------------------------------------------------
qSlicerEMSegment4ModulePrivate::qSlicerEMSegment4ModulePrivate()
{
}

//-----------------------------------------------------------------------------
// qSlicerEMSegment4Module methods

//-----------------------------------------------------------------------------
qSlicerEMSegment4Module::qSlicerEMSegment4Module(QObject* _parent)
  : Superclass(_parent)
  , d_ptr(new qSlicerEMSegment4ModulePrivate)
{
}

//-----------------------------------------------------------------------------
qSlicerEMSegment4Module::~qSlicerEMSegment4Module()
{
}

//-----------------------------------------------------------------------------
QString qSlicerEMSegment4Module::helpText()const
{
  return QString();
}

//-----------------------------------------------------------------------------
QString qSlicerEMSegment4Module::acknowledgementText()const
{
  return "This work was supported by nothing but hot air :D";
}

//-----------------------------------------------------------------------------
QIcon qSlicerEMSegment4Module::icon()const
{
  return QIcon("");
}

//-----------------------------------------------------------------------------
void qSlicerEMSegment4Module::setup()
{
  this->Superclass::setup();

}

//-----------------------------------------------------------------------------
qSlicerAbstractModuleRepresentation * qSlicerEMSegment4Module::createWidgetRepresentation()
{
  return 0;
}

//-----------------------------------------------------------------------------
vtkMRMLAbstractLogic* qSlicerEMSegment4Module::createLogic()
{
  return 0;
}

//-----------------------------------------------------------------------------
bool qSlicerEMSegment4Module::isHidden()const
{
  return true;
}
