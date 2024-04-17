import QtQuick 2.15


Item {
    id: zoomOutBtnID
    width: with_btn
    height: with_btn
    signal clicked();
    property int with_btn: 0


    Rectangle{
        id: bgZoomOutBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconZoomOutID
            width: zoomOutBtnID.width/2
            height: zoomOutBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/zoom_out_b.png"
        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            zoomOutBtnID.clicked()
        }

        onEntered:     {
            bgZoomOutBtnID.border.color = "darkorange"
            bgZoomOutBtnID.scale = 1.1
        }
        onExited: {
            bgZoomOutBtnID.border.color = "darkcyan"
            bgZoomOutBtnID.scale = 1
        }
    }
}
