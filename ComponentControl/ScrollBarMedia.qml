import QtQuick 2.15

Item {
    id: itemScrollbarID
    width: widthScrollbar
    height: heightScrollbar
    signal clicked()
    signal pressed()
    signal released()
    property int widthScrollbar: 0
    property int heightScrollbar: 0

    Rectangle{
        id: bgScrollbarID
        anchors.fill: parent
        color: "darkcyan"

        radius: parent.height/2
        border.color: "gray"

        Rectangle{
            id: pointID
            width: heightScrollbar+10
            height: width
            color: "yellow"

            MouseArea{

            }
        }



        MouseArea{
            anchors.fill: parent

            onClicked: {

            }

            onPressed: {

            }

            onReleased: {

            }
        }
    }

    MouseArea{
        anchors.fill: parent
    }

}
