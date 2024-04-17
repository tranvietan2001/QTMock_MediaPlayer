import QtQuick 2.15


Item {
    id: pauseBtnID
    width: with_btn
    height: with_btn
    signal clicked();
    property int with_btn: 0

    Rectangle{
        id: bgPauseBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconPauseID
            width: pauseBtnID.width/2
            height: pauseBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/pause_b.png"
        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            pauseBtnID.clicked()
        }

        onEntered:     {
            bgPauseBtnID.border.color = "darkorange"
            bgPauseBtnID.scale = 1.1
        }
        onExited: {
            bgPauseBtnID.border.color = "darkcyan"
            bgPauseBtnID.scale = 1
        }
    }
}
