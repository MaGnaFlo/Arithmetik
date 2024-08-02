cmake_minimum_required(VERSION 3.16)

project(Arithmetik VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(qtcsv REQUIRED)

qt_standard_project_setup()

qt_add_executable(appArithmetik
    main.cpp
    controller.h controller.cpp
    Resource.qrc
)

qt_add_qml_module(appArithmetik
    URI Arithmetik
    VERSION 1.0
    QML_FILES Main.qml StartPage.qml GamePage.qml ResultPage.qml CalibrationPage.qml
)

set_target_properties(appArithmetik PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include_directories("/usr/local/include")
include_directories(${qtcsv_INCLUDE_DIRS})

target_link_libraries(appArithmetik
    PRIVATE Qt6::Quick
    qtcsv
)

install(TARGETS appArithmetik
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
