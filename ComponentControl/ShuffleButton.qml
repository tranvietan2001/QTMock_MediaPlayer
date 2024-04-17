import QtQuick 2.15


Item {
    id: shuffleBtnID
    width: widthBtn
    height: widthBtn
    signal clicked();
    property int widthBtn: 0
    property bool statusShuffle: false

    Rectangle{
        id: bgShuffleBtnID
        anchors.fill: parent
        radius: parent.width / 2
        border.color: "darkcyan"
        visible: true

        Image {
            id: iconShuffleID
            width: shuffleBtnID.width/2
            height: shuffleBtnID.height/2
            anchors.centerIn: parent
            source: "./icon/shuffle_b.png"
        }
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            shuffleBtnID.clicked()

            statusShuffle = !statusShuffle

            if(statusShuffle){
                bgShuffleBtnID.color = "darkcyan"
            }else bgShuffleBtnID.color = "transparent"


        }

        onEntered:     {
            bgShuffleBtnID.border.color = "darkorange"
            bgShuffleBtnID.scale = 1.1
        }
        onExited: {
            bgShuffleBtnID.border.color = "darkcyan"
            bgShuffleBtnID.scale = 1
        }
    }
}
