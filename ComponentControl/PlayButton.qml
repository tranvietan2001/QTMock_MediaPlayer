import QtQuick 2.15


Item {
    id: playBtnID
    width: 50
    height: 50
    signal clicked();

    Rectangle{
        id: bgPlayBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "red"
        visible: true

        Image {
            id: iconPlayID
            width: playBtnID.width/3*2
            height: playBtnID.height/3*2
            anchors.centerIn: parent
            source: "./icon/play_b.png"
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            playBtnID.clicked()
        }
    }
}
