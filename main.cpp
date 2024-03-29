#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCursor>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    const QCursor cursor(Qt::BlankCursor);
    app.setOverrideCursor(cursor);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/testqtonrpi/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
