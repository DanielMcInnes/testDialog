cmake_minimum_required(VERSION 3.16)

project(testDialog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(REQUIRED_QT_VERSION 6.5.2) # require at least qt 6.5.2 for qt_add_qml_module to work properly
find_package(Qt6 ${REQUIRED_QT_VERSION} COMPONENTS Quick QuickControls2 REQUIRED)
#find_package(Qt6 6.5 COMPONENTS Quick QuickControls2 REQUIRED)

qt_add_executable(apptestDialog
    main.cpp
)

qt_add_qml_module(apptestDialog
    URI testDialog
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(apptestDialog PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptestDialog
    PRIVATE Qt6::Quick Qt6::QuickControls2 )

install(TARGETS apptestDialog
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
