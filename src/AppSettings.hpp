#ifndef APPSETTINGS_HPP
#define APPSETTINGS_HPP

#include <QObject>
#include <QUrl>

/**
 * AppSettings Description
 *
 * This class handles application wide settings that persist between runs.
 */
class AppSettings: public QObject {
    Q_OBJECT

    Q_PROPERTY(bool adaptiveTheme READ adaptiveTheme WRITE setAdaptiveTheme NOTIFY adaptiveThemeChanged FINAL)
    Q_PROPERTY(int theme READ theme WRITE setTheme NOTIFY themeChanged FINAL)

public:
    AppSettings(QObject *parent = 0);

    bool adaptiveTheme() const;
    int theme() const;

public slots:

    void setAdaptiveTheme(bool adaptiveTheme);
    void setTheme(int theme);
    void reset();

signals:

    void adaptiveThemeChanged(bool adaptiveTheme);
    void themeChanged(int theme);

private:

    static const bool    mDefaultAdaptiveTheme;
    static const int     mDefaultTheme;

    // Settings keys.
    static const QString KCO_ADAPTIVETHEME_KEY;
    static const QString KCO_THEME_KEY;

    /**
     * The property variables.
     */
    bool    mAdaptiveTheme;
    int     mTheme;
};
#endif
