/****************************************************************************
** Meta object code from reading C++ file 'ConsoleWorkflowModel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../src/model/ConsoleWorkflowModel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ConsoleWorkflowModel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ConsoleWorkflowModel_t {
    QByteArrayData data[22];
    char stringdata0[311];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ConsoleWorkflowModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ConsoleWorkflowModel_t qt_meta_stringdata_ConsoleWorkflowModel = {
    {
QT_MOC_LITERAL(0, 0, 20), // "ConsoleWorkflowModel"
QT_MOC_LITERAL(1, 21, 19), // "currentStateChanged"
QT_MOC_LITERAL(2, 41, 0), // ""
QT_MOC_LITERAL(3, 42, 22), // "selectedSurgeonChanged"
QT_MOC_LITERAL(4, 65, 18), // "pinProgressChanged"
QT_MOC_LITERAL(5, 84, 19), // "ergoProgressChanged"
QT_MOC_LITERAL(6, 104, 19), // "monopolarCutChanged"
QT_MOC_LITERAL(7, 124, 18), // "bipolarCoagChanged"
QT_MOC_LITERAL(8, 143, 12), // "currentState"
QT_MOC_LITERAL(9, 156, 15), // "selectedSurgeon"
QT_MOC_LITERAL(10, 172, 11), // "pinProgress"
QT_MOC_LITERAL(11, 184, 12), // "ergoProgress"
QT_MOC_LITERAL(12, 197, 12), // "monopolarCut"
QT_MOC_LITERAL(13, 210, 11), // "bipolarCoag"
QT_MOC_LITERAL(14, 222, 5), // "State"
QT_MOC_LITERAL(15, 228, 13), // "AccountSelect"
QT_MOC_LITERAL(16, 242, 8), // "PinEntry"
QT_MOC_LITERAL(17, 251, 10), // "Ergonomics"
QT_MOC_LITERAL(18, 262, 15), // "ProcedureSelect"
QT_MOC_LITERAL(19, 278, 12), // "EnergyConfig"
QT_MOC_LITERAL(20, 291, 8), // "Overview"
QT_MOC_LITERAL(21, 300, 10) // "SystemMenu"

    },
    "ConsoleWorkflowModel\0currentStateChanged\0"
    "\0selectedSurgeonChanged\0pinProgressChanged\0"
    "ergoProgressChanged\0monopolarCutChanged\0"
    "bipolarCoagChanged\0currentState\0"
    "selectedSurgeon\0pinProgress\0ergoProgress\0"
    "monopolarCut\0bipolarCoag\0State\0"
    "AccountSelect\0PinEntry\0Ergonomics\0"
    "ProcedureSelect\0EnergyConfig\0Overview\0"
    "SystemMenu"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ConsoleWorkflowModel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       6,   50, // properties
       1,   74, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,
       3,    0,   45,    2, 0x06 /* Public */,
       4,    0,   46,    2, 0x06 /* Public */,
       5,    0,   47,    2, 0x06 /* Public */,
       6,    0,   48,    2, 0x06 /* Public */,
       7,    0,   49,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       8, QMetaType::Int, 0x00495103,
       9, QMetaType::QString, 0x00495103,
      10, QMetaType::Int, 0x00495103,
      11, QMetaType::Double, 0x00495103,
      12, QMetaType::Int, 0x00495103,
      13, QMetaType::Int, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

 // enums: name, alias, flags, count, data
      14,   14, 0x0,    7,   79,

 // enum data: key, value
      15, uint(ConsoleWorkflowModel::AccountSelect),
      16, uint(ConsoleWorkflowModel::PinEntry),
      17, uint(ConsoleWorkflowModel::Ergonomics),
      18, uint(ConsoleWorkflowModel::ProcedureSelect),
      19, uint(ConsoleWorkflowModel::EnergyConfig),
      20, uint(ConsoleWorkflowModel::Overview),
      21, uint(ConsoleWorkflowModel::SystemMenu),

       0        // eod
};

void ConsoleWorkflowModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ConsoleWorkflowModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->currentStateChanged(); break;
        case 1: _t->selectedSurgeonChanged(); break;
        case 2: _t->pinProgressChanged(); break;
        case 3: _t->ergoProgressChanged(); break;
        case 4: _t->monopolarCutChanged(); break;
        case 5: _t->bipolarCoagChanged(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::currentStateChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::selectedSurgeonChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::pinProgressChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::ergoProgressChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::monopolarCutChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ConsoleWorkflowModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&ConsoleWorkflowModel::bipolarCoagChanged)) {
                *result = 5;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ConsoleWorkflowModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->currentState(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->selectedSurgeon(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->pinProgress(); break;
        case 3: *reinterpret_cast< double*>(_v) = _t->ergoProgress(); break;
        case 4: *reinterpret_cast< int*>(_v) = _t->monopolarCut(); break;
        case 5: *reinterpret_cast< int*>(_v) = _t->bipolarCoag(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<ConsoleWorkflowModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setCurrentState(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setSelectedSurgeon(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setPinProgress(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setErgoProgress(*reinterpret_cast< double*>(_v)); break;
        case 4: _t->setMonopolarCut(*reinterpret_cast< int*>(_v)); break;
        case 5: _t->setBipolarCoag(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject ConsoleWorkflowModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ConsoleWorkflowModel.data,
    qt_meta_data_ConsoleWorkflowModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ConsoleWorkflowModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ConsoleWorkflowModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ConsoleWorkflowModel.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ConsoleWorkflowModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ConsoleWorkflowModel::currentStateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ConsoleWorkflowModel::selectedSurgeonChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ConsoleWorkflowModel::pinProgressChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void ConsoleWorkflowModel::ergoProgressChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ConsoleWorkflowModel::monopolarCutChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void ConsoleWorkflowModel::bipolarCoagChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
