import QtQuick 2.15


Item {
    id: zoomInBtnID
    width: 50
    height: 50
    signal clicked();


    Rectangle{
        id: bgZoomInBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconZoomInID
            width: zoomInBtnID.width/2
            height: zoomInBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/zoom_in_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            zoomInBtnID.clicked()
        }

        onEntered:     {
            bgZoomInBtnID.border.color = "darkorange"
            bgZoomInBtnID.scale = 1.1
        }
        onExited: {
            bgZoomInBtnID.border.color = "darkcyan"
            bgZoomInBtnID.scale = 1
        }
    }
}
