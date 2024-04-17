import QtQuick 2.15


Item {
    id: playBtnID
    width: with_btn
    height: with_btn
    signal clicked();
    property int with_btn: 0

    Rectangle{
        id: bgPlayBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconPlayID
            width: playBtnID.width/2
            height: playBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/play_b.png"
        }
    }

    MouseArea{
        anchors.fill: parent

        hoverEnabled: true

        onClicked: {
            playBtnID.clicked()
        }

        onEntered:     {
            bgPlayBtnID.border.color = "darkorange"
            bgPlayBtnID.scale = 1.1
        }
        onExited: {
            bgPlayBtnID.border.color = "darkcyan"
            bgPlayBtnID.scale = 1
        }
    }
}
