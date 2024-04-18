import QtQuick 2.15


Item {
    id: loopBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0

    property int sttLoopBtn: 0


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

    Rectangle{
        id: bgLoopOneBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkorange"
        visible: false

        Image {
            id: iconLoopOneID
            width: loopOneBtnID.width/2
            height: loopOneBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/loop_one_b.png"
        }
    }




    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            sttLoopBtn = !sttLoopBtn

            if(sttLoopBtn) bgLoopBtnID.color= "darkcyan"
            else bgLoopBtnID.color = "transparent"

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
