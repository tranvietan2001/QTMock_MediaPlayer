import QtQuick 2.15


Item {
    Rectangle{
        id: playBtnID
        width: 50
        height: width
        radius: width/2
        border.color: "red"
        // color: "lightblue"

        visible: true

        property real countClick: 0

        // Image {
        //     id: iconPlayID
        //     // anchors.fill: parent
        //     width: playBtnID.width/3*2
        //     height: playBtnID.height/3*2

        //     anchors.centerIn: parent
        //     source: "./icon/play_b.png"
        // }
        // AnimatedImage { id: animation; source: "./icon/playmusic.gif" }


        MouseArea{
            anchors.fill: parent

            onClicked: {
                count++
                console.log(count)
            }
        }


        Rectangle {
            width: animation.width; height: animation.height + 8

            AnimatedImage { id: animation; source: "icon/playmusic.gif" }

            Rectangle {
                property int frames: animation.frameCount

                width: 4; height: 8
                x: (animation.width - width) * animation.currentFrame / frames
                y: animation.height
                color: "red"
            }
        }



    }
}
