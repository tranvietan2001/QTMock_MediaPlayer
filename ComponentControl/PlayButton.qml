import QtQuick 2.15


Item {
    id: itemPlayBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0
    property bool sttPlayBtn: true


    Rectangle{
        id: bgPauseBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconPauseID
            width: itemPlayBtnID.width/2
            height: itemPlayBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/pause_b.png"
        }
    }


    Rectangle{
        id: bgPlayBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: false

        Image {
            id: iconPlayID
            width: itemPlayBtnID.width/2
            height: itemPlayBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/play_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            sttPlayBtn = !sttPlayBtn

            if(sttPlayBtn){
                console.log("PAUSE")
                bgPauseBtnID.visible = true
                bgPlayBtnID.visible = false
            }
            else {
                console.log("PLAY")
                bgPauseBtnID.visible = false
                bgPlayBtnID.visible = true
            }
            itemPlayBtnID.clicked()
        }

        onEntered:     {
            bgPlayBtnID.border.color = "darkorange"
            bgPlayBtnID.scale = 1.1
            bgPauseBtnID.border.color = "darkorange"
            bgPauseBtnID.scale = 1.1
        }
        onExited: {
            bgPlayBtnID.border.color = "darkcyan"
            bgPlayBtnID.scale = 1
            bgPauseBtnID.border.color = "darkcyan"
            bgPauseBtnID.scale = 1
        }
    }
}
