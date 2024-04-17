import QtQuick 2.15


Item {
    id: pauseBtnID
    width: 50
    height: 50
    signal clicked();

    Rectangle{
        id: bgPauseBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "red"
        visible: true

        Image {
            id: iconPauseID
            width: pauseBtnID.width/3*2
            height: pauseBtnID.height/3*2
            anchors.centerIn: parent
            source: "./icon/pause_b.png"
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            pauseBtnID.clicked()
        }
    }
}
