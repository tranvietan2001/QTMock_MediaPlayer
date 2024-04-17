import QtQuick 2.15


Item {
    id: forwardBtnID
    width: with_btn
    height: with_btn
    signal clicked();
    property int with_btn: 0


    Rectangle{
        id: bgForwardBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconForwardID
            width: forwardBtnID.width/2
            height: forwardBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/next_10s_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            forwardBtnID.clicked()
        }

        onEntered:     {
            bgForwardBtnID.border.color = "darkorange"
            bgForwardBtnID.scale = 1.1
        }
        onExited: {
            bgForwardBtnID.border.color = "darkcyan"
            bgForwardBtnID.scale = 1
        }
    }
}
