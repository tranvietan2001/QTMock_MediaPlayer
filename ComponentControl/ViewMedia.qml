import QtQuick 2.15

Item {
    id: viewMediaID
    width: widthView
    height: heightView
    property int widthView: 0
    property int heightView: 0

    Rectangle{
        id: bgViewMediaID
        anchors.fill: parent
        color: "white"
    }
}
