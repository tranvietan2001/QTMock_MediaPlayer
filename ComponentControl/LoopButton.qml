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
            visible: true

        }

        Image {
            id: iconLoopOneID
            width: loopBtnID.width/2
            height: loopBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/loop_one_b.png"
            visible: false

        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            sttLoopBtn++
            if (sttLoopBtn > 2) sttLoopBtn = 0

            if(sttLoopBtn == 0){
                bgLoopBtnID.color = "transparent"
                bgLoopBtnID.border.color = "darkcyan"
                iconLoopID.visible = true
                iconLoopOneID.visible = false
            }
            else if(sttLoopBtn == 1){
                bgLoopBtnID.color = "darkcyan"
                bgLoopBtnID.border.color = "darkorange"
                iconLoopID.visible = false
                iconLoopOneID.visible = true
            }else if(sttLoopBtn == 2){
                bgLoopBtnID.color = "darkcyan"
                bgLoopBtnID.border.color = "darkorange"
                iconLoopID.visible = true
                iconLoopOneID.visible = false
            }

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
