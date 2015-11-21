#include "AppSettings.hpp"

#include <QCoreApplication>
#include <QDebug>
#include <QSettings>


// Setting default values.
const bool    AppSettings::mDefaultAdaptiveTheme(false);
const int     AppSettings::mDefaultTheme(2);

// Settings keys.
const QString AppSettings::KCO_ADAPTIVETHEME_KEY("adaptiveTheme");
const QString AppSettings::KCO_THEME_KEY("theme");

AppSettings::AppSettings(QObject* parent) : QObject(parent) {
    // Set up the QSettings object for the application with organization and application name.
    QCoreApplication::setOrganizationName("Köster Yazilim Danismanlik Hizmetleri");
    QCoreApplication::setApplicationName("BB10QNX Shortener");

    // Load the values from QSettings or set as the default values if not yet set.
    mAdaptiveTheme = QSettings().value(KCO_ADAPTIVETHEME_KEY, mDefaultAdaptiveTheme).toBool();
    mTheme = QSettings().value(KCO_THEME_KEY, mDefaultTheme).toInt();
}

bool AppSettings::adaptiveTheme() const {
    return mAdaptiveTheme;
}

int AppSettings::theme() const {
    return mTheme;
}


void AppSettings::reset() {

    setAdaptiveTheme(mDefaultAdaptiveTheme);
    setTheme(mDefaultTheme);
}

void AppSettings::setAdaptiveTheme(bool adaptiveTheme) {
    if (mAdaptiveTheme != adaptiveTheme) {
        QSettings().setValue(KCO_ADAPTIVETHEME_KEY, adaptiveTheme);
        mAdaptiveTheme = adaptiveTheme;
        emit adaptiveThemeChanged(adaptiveTheme);
    }
}

void AppSettings::setTheme(int theme) {
    if (mTheme != theme) {
        QSettings().setValue(KCO_THEME_KEY, theme);
        mTheme = theme;
        emit themeChanged(theme);
    }
}
