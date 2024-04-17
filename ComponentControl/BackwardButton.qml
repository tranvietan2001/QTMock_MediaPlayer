import QtQuick 2.15


Item {
    id: backwardBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0


    Rectangle{
        id: bgBackwardBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconBackwardID
            width: backwardBtnID.width/2
            height: backwardBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/previous_10s_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            backwardBtnID.clicked()
        }

        onEntered:     {
            bgBackwardBtnID.border.color = "darkorange"
            bgBackwardBtnID.scale = 1.1
        }
        onExited: {
            bgBackwardBtnID.border.color = "darkcyan"
            bgBackwardBtnID.scale = 1
        }
    }
}
