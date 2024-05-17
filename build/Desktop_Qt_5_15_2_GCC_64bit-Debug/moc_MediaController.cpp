/****************************************************************************
** Meta object code from reading C++ file 'MediaController.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Controller/MediaController.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'MediaController.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MediaController_t {
    QByteArrayData data[19];
    char stringdata0[273];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MediaController_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MediaController_t qt_meta_stringdata_MediaController = {
    {
QT_MOC_LITERAL(0, 0, 15), // "MediaController"
QT_MOC_LITERAL(1, 16, 23), // "pathFilesSongCtrChanged"
QT_MOC_LITERAL(2, 40, 0), // ""
QT_MOC_LITERAL(3, 41, 19), // "inforDataCtrChanged"
QT_MOC_LITERAL(4, 61, 16), // "indexPlayChanged"
QT_MOC_LITERAL(5, 78, 19), // "isCheckModelCtrEmty"
QT_MOC_LITERAL(6, 98, 16), // "valVolumeChanged"
QT_MOC_LITERAL(7, 115, 15), // "durationChanged"
QT_MOC_LITERAL(8, 131, 15), // "positionChanged"
QT_MOC_LITERAL(9, 147, 8), // "position"
QT_MOC_LITERAL(10, 156, 15), // "processListData"
QT_MOC_LITERAL(11, 172, 8), // "playSong"
QT_MOC_LITERAL(12, 181, 12), // "setValVolume"
QT_MOC_LITERAL(13, 194, 12), // "newValVolume"
QT_MOC_LITERAL(14, 207, 19), // "playMusicAtPosition"
QT_MOC_LITERAL(15, 227, 16), // "pathFilesSongCtr"
QT_MOC_LITERAL(16, 244, 9), // "indexPlay"
QT_MOC_LITERAL(17, 254, 9), // "valVolume"
QT_MOC_LITERAL(18, 264, 8) // "duration"

    },
    "MediaController\0pathFilesSongCtrChanged\0"
    "\0inforDataCtrChanged\0indexPlayChanged\0"
    "isCheckModelCtrEmty\0valVolumeChanged\0"
    "durationChanged\0positionChanged\0"
    "position\0processListData\0playSong\0"
    "setValVolume\0newValVolume\0playMusicAtPosition\0"
    "pathFilesSongCtr\0indexPlay\0valVolume\0"
    "duration"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MediaController[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       5,   86, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   69,    2, 0x06 /* Public */,
       3,    0,   70,    2, 0x06 /* Public */,
       4,    0,   71,    2, 0x06 /* Public */,
       5,    0,   72,    2, 0x06 /* Public */,
       6,    0,   73,    2, 0x06 /* Public */,
       7,    0,   74,    2, 0x06 /* Public */,
       8,    1,   75,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      10,    0,   78,    2, 0x0a /* Public */,
      11,    0,   79,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      12,    1,   80,    2, 0x02 /* Public */,
      14,    1,   83,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::LongLong,    9,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,   13,
    QMetaType::Void, QMetaType::LongLong,    9,

 // properties: name, type, flags
      15, QMetaType::QString, 0x00495103,
      16, QMetaType::Int, 0x00495103,
      17, QMetaType::Int, 0x00495103,
      18, QMetaType::LongLong, 0x00495001,
       9, QMetaType::LongLong, 0x00495001,

 // properties: notify_signal_id
       0,
       2,
       4,
       5,
       6,

       0        // eod
};

void MediaController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MediaController *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->pathFilesSongCtrChanged(); break;
        case 1: _t->inforDataCtrChanged(); break;
        case 2: _t->indexPlayChanged(); break;
        case 3: _t->isCheckModelCtrEmty(); break;
        case 4: _t->valVolumeChanged(); break;
        case 5: _t->durationChanged(); break;
        case 6: _t->positionChanged((*reinterpret_cast< qint64(*)>(_a[1]))); break;
        case 7: _t->processListData(); break;
        case 8: _t->playSong(); break;
        case 9: _t->setValVolume((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 10: _t->playMusicAtPosition((*reinterpret_cast< qint64(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::pathFilesSongCtrChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::inforDataCtrChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::indexPlayChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::isCheckModelCtrEmty)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::valVolumeChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (MediaController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::durationChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (MediaController::*)(qint64 );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MediaController::positionChanged)) {
                *result = 6;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<MediaController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->pathFilesSongCtr(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->indexPlay(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->valVolume(); break;
        case 3: *reinterpret_cast< qint64*>(_v) = _t->duration(); break;
        case 4: *reinterpret_cast< qint64*>(_v) = _t->position(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<MediaController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPathFilesSongCtr(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setIndexPlay(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setValVolume(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject MediaController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_MediaController.data,
    qt_meta_data_MediaController,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MediaController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MediaController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MediaController.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MediaController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MediaController::pathFilesSongCtrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MediaController::inforDataCtrChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void MediaController::indexPlayChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void MediaController::isCheckModelCtrEmty()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void MediaController::valVolumeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void MediaController::durationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void MediaController::positionChanged(qint64 _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
