#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Model/SongModel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // fix lỗi QML Settings: The following application identifiers have not been set: QVector("organizationName", "organizationDomain")
    app.setOrganizationName("MediaPlayerApp");
    app.setOrganizationDomain("MediaPlayerApp.xxx");

    QQmlApplicationEngine engine;

    qmlRegisterType<SongModel>("SongModel", 1,0,"SongModel");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
