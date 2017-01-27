TEMPLATE = app
QT += qml quick
CONFIG += link_pkgconfig
PKGCONFIG += qdeclarative5-boostable

SOURCES +=     main.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += main.qml

TARGET = asteroid-compass
target.path = /usr/bin/

desktop.files = asteroid-compass.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop

DISTFILES +=
