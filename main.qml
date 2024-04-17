import QtQuick 2.15
import QtQuick.Window 2.15
import "ComponentControl"
Window {
    width: 1390
    height: 750
    visible: true
    title: qsTr("Media Player")

    property real count: 0
    Row{
        id: rowViewID
        anchors.fill: parent

        Rectangle{
            id: r1
            // width: rowViewID.width/3
            width: 200
            height: rowViewID.height
            color: "#DDDDDD"
            visible: true
            // opacity: 0.5

            // Text {
            //     id: name1
            //     text: qsTr("text11")
            // }


            Column{
                spacing: 2
                anchors.fill: parent

                Rectangle{
                    id: homeRecID
                    width: parent.width
                    height: 50
                    color: "black"
                }

                Rectangle{
                    id: audioRecID
                    width: parent.width
                    height: 50
                    color: "black"
                }

                Rectangle{
                    id: videoRecID
                    width: parent.width
                    height: 50
                    color: "black"
                }

                Rectangle{
                    id: historyRecID
                    width: parent.width
                    height: 50
                    color: "black"
                }
                Rectangle{
                    id: settingRecID
                    width: parent.width
                    height: 50
                    color: "black"

                }

                PlayButton{
                    id: playerBtn
                    onClicked: {
                        count++
                        console.log("play: "+count)
                    }
                }


                PauseButton{
                    id: pauseBtn
                    onClicked: {
                        count++
                        console.log("pause: "+count)
                    }
                }

            }
        }

        Rectangle{
            id: r2
            // width: rowViewID.width - rowViewID.width/3
            width: rowViewID.width - r1.width
            height: rowViewID.height
            color: "#FFFFFF"
            visible: true
            Text {
                id: name2
                text: qsTr("text")
            }
        }


    }

    // TabBar {
    //     id: bar
    //     width: parent.width
    //     TabButton {
    //         text: qsTr("Home")
    //     }
    //     TabButton {
    //         text: qsTr("Discover")
    //     }
    //     TabButton {
    //         text: qsTr("Activity")
    //     }
    // }


    // Rectangle{
    //     id: btnCheckID

    //     width: 100
    //     height: 100
    //     color: "lightblue"
    // }

    onWidthChanged: {
        console.log(width)
        console.log(height)
        // if(width > 1000) {

        //     // r1.visible = false
        //     r2.width = width
        // }
        // else{

        //     r1.visible = true
        // }
        // r1.width = rowViewID.width/3
        // r2.width = rowViewID.width - rowViewID.width/3
    }

}
