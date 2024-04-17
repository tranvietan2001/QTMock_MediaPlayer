import QtQuick 2.15


Item {
    id: loopBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0
    property int  sttLoopBtn: 0


    Rectangle{
        id: bgLoopBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconLoopID
            width: loopBtnID.width/2
            height: loopBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/loop_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {


            // if(sttLoopBtn == 0) bgLoopBtnID.color = "while"
            // else if(sttLoopBtn == 2) bgLoopBtnID.color = "drakcyan"

            loopBtnID.clicked()
        }

        onEntered:     {
            bgLoopBtnID.border.color = "darkorange"
            bgLoopBtnID.scale = 1.1
        }
        onExited: {
            bgLoopBtnID.border.color = "darkcyan"
            bgLoopBtnID.scale = 1
        }
    }
}
