import QtQuick 2.15


Item {
    id: nextBtnID
    width: 50
    height: 50
    signal clicked();


    Rectangle{
        id: bgNextBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconNextID
            width: nextBtnID.width/2
            height: nextBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/previous_10s_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            nextBtnID.clicked()
        }

        onEntered:     {
            bgNextBtnID.border.color = "darkorange"
            bgNextBtnID.scale = 1.1
        }
        onExited: {
            bgNextBtnID.border.color = "darkcyan"
            bgNextBtnID.scale = 1
        }
    }
}
