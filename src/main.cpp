#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "controller.h"


int main(int argc, char** argv)
{
    QGuiApplication app(argc, argv);

    Controller controller;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_controller", &controller);

    const QUrl url(u"qrc:/Arithmetik/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
