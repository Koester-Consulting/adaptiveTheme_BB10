/****************************************************************************
** Meta object code from reading C++ file 'AppSettings.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/AppSettings.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AppSettings.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AppSettings[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       2,   39, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      27,   13,   12,   12, 0x05,
      60,   54,   12,   12, 0x05,

 // slots: signature, parameters, type, tag, flags
      78,   13,   12,   12, 0x0a,
     101,   54,   12,   12, 0x0a,
     115,   12,   12,   12, 0x0a,

 // properties: name, type, flags
      13,  123, 0x01495903,
      54,  128, 0x02495903,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

static const char qt_meta_stringdata_AppSettings[] = {
    "AppSettings\0\0adaptiveTheme\0"
    "adaptiveThemeChanged(bool)\0theme\0"
    "themeChanged(int)\0setAdaptiveTheme(bool)\0"
    "setTheme(int)\0reset()\0bool\0int\0"
};

void AppSettings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        AppSettings *_t = static_cast<AppSettings *>(_o);
        switch (_id) {
        case 0: _t->adaptiveThemeChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->themeChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->setAdaptiveTheme((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->setTheme((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->reset(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData AppSettings::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject AppSettings::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AppSettings,
      qt_meta_data_AppSettings, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AppSettings::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AppSettings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AppSettings::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AppSettings))
        return static_cast<void*>(const_cast< AppSettings*>(this));
    return QObject::qt_metacast(_clname);
}

int AppSettings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = adaptiveTheme(); break;
        case 1: *reinterpret_cast< int*>(_v) = theme(); break;
        }
        _id -= 2;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setAdaptiveTheme(*reinterpret_cast< bool*>(_v)); break;
        case 1: setTheme(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 2;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AppSettings::adaptiveThemeChanged(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AppSettings::themeChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
