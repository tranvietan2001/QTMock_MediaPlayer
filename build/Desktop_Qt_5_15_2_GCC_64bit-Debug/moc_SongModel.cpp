/****************************************************************************
** Meta object code from reading C++ file 'SongModel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Model/SongModel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SongModel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SongModel_t {
    QByteArrayData data[10];
    char stringdata0[149];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SongModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SongModel_t qt_meta_stringdata_SongModel = {
    {
QT_MOC_LITERAL(0, 0, 9), // "SongModel"
QT_MOC_LITERAL(1, 10, 21), // "pathFolderSongChanged"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 20), // "pathFilesSongChanged"
QT_MOC_LITERAL(4, 54, 16), // "inforDataChanged"
QT_MOC_LITERAL(5, 71, 16), // "isCheckModelEmty"
QT_MOC_LITERAL(6, 88, 14), // "pathFolderSong"
QT_MOC_LITERAL(7, 103, 13), // "pathFilesSong"
QT_MOC_LITERAL(8, 117, 9), // "inforData"
QT_MOC_LITERAL(9, 127, 21) // "QList<InforMediaFile>"

    },
    "SongModel\0pathFolderSongChanged\0\0"
    "pathFilesSongChanged\0inforDataChanged\0"
    "isCheckModelEmty\0pathFolderSong\0"
    "pathFilesSong\0inforData\0QList<InforMediaFile>"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SongModel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       3,   38, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x06 /* Public */,
       3,    0,   35,    2, 0x06 /* Public */,
       4,    0,   36,    2, 0x06 /* Public */,
       5,    0,   37,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       6, QMetaType::QString, 0x00495903,
       7, QMetaType::QString, 0x00495903,
       8, 0x80000000 | 9, 0x00495009,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

void SongModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SongModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->pathFolderSongChanged(); break;
        case 1: _t->pathFilesSongChanged(); break;
        case 2: _t->inforDataChanged(); break;
        case 3: _t->isCheckModelEmty(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (SongModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SongModel::pathFolderSongChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (SongModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SongModel::pathFilesSongChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (SongModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SongModel::inforDataChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (SongModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&SongModel::isCheckModelEmty)) {
                *result = 3;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<SongModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->pathFolderSong(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->pathFilesSong(); break;
        case 2: *reinterpret_cast< QList<InforMediaFile>*>(_v) = _t->getInforData(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<SongModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPathFolderSong(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setPathFilesSong(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject SongModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractListModel::staticMetaObject>(),
    qt_meta_stringdata_SongModel.data,
    qt_meta_data_SongModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SongModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SongModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SongModel.stringdata0))
        return static_cast<void*>(this);
    return QAbstractListModel::qt_metacast(_clname);
}

int SongModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractListModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void SongModel::pathFolderSongChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void SongModel::pathFilesSongChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void SongModel::inforDataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void SongModel::isCheckModelEmty()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
