import QtQuick 2.15

Item {
    id: loopOneBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0

    property bool sttLoopOneBtn: false


    Rectangle{
        id: bgLoopOneBtnID
        anchors.fill: parent
        radius: parent.width / 2
        visible: true

        // color: "darkcyan"
        border.color: "darkorange"

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
            sttLoopOneBtn = !sttLoopOneBtn

            if(sttLoopOneBtn){
                bgLoopOneBtnID.color = "darkcyan"
                bgLoopOneBtnID.border.color = "darkorange"
            }

            else{
                bgLoopOneBtnID.color = "transparent"
                bgLoopOneBtnID.border.color = "darkcyan"
            }

            loopOneBtnID.clicked()


        }

        onEntered:     {
            bgLoopOneBtnID.border.color = "darkorange"
            bgLoopOneBtnID.scale = 1.1
        }
        onExited: {
            bgLoopOneBtnID.border.color = "darkcyan"
            bgLoopOneBtnID.scale = 1
        }
    }
}
