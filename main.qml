import QtQuick 2.15
import QtQuick.Window 2.15
import "ComponentControl"
Window {
    width: 1390
    height: 750
    minimumWidth: 760
    minimumHeight: 400
    visible: true
    title: qsTr("Media Player")

    Row{
        id: rowViewID
        anchors.fill: parent

        Rectangle{
            id: r1
            // width: rowViewID.width/3
            width: 200
            height: rowViewID.height
            color: "silver"
            visible: true
            // opacity: 0.5

            Column{
                spacing: 2
                anchors.fill: parent

                TabButton{
                    id: homeTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Home"
                    pathImg: "qrc:/ComponentControl/icon/home_b.png"
                }

                TabButton{
                    id: musicTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Music List"
                    pathImg: "qrc:/ComponentControl/icon/playlist_b.png"
                }

                TabButton{
                    id: videoTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Video List"
                    pathImg: "qrc:/ComponentControl/icon/videolist_b.png"
                }
                TabButton{
                    id: historyTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "History"
                    pathImg: "qrc:/ComponentControl/icon/history_b.png"
                }

            }
        }

        ViewMedia{
            id: viewAudioID
            width: rowViewID.width - r1.width
            height: rowViewID.height
            // color: "#FFFFFF"
            visible: true

            Column{
                anchors.fill: parent
                Rectangle{
                    id: viewAreaID
                    width: parent.width
                    height: parent.height - controlMediaID.height
                    color: "red"

                    visible: true
                }

                Rectangle{
                    id:itemControlMediaID
                    width: parent.width
                    height: 100
                    // color: "springgreen"
                    visible: true

                    Row{
                        // spacing: 2
                        Rectangle {
                            id: inforMediaID
                            color: "blue";
                            width: itemControlMediaID.width/3
                            height: itemControlMediaID.height
                        }
                        Rectangle {
                            id: controlMediaID
                            color: "green";
                            width: itemControlMediaID.width - inforMediaID.width
                            height: itemControlMediaID.height

                            Column{
                                anchors.fill: parent
                                // spacing: 1

                                Rectangle{
                                    width: parent.width
                                    height: parent.height/3
                                    // color: "gray"

                                    Row{
                                        width: parent.width
                                        height: parent.height
                                        Rectangle{
                                            width: parent.width *20/100
                                            height: parent.height
                                            color: "transparent"

                                            Text {
                                                id: positionPlayerID
                                                text: "00:00"
                                                anchors.centerIn: parent
                                            }

                                        }
                                        Rectangle{
                                            width: parent.width *60/100
                                            height: parent.height
                                            // color: "red"

                                            MediaProgressBar{
                                                id: progressPlayerID
                                                width: parent.width
                                                height: 10
                                                anchors.centerIn: parent
                                                sizePoint: 20

                                                // colorBackground: "black"
                                                colorTimeLine: "darkcyan"
                                                colorPoint: "darkorange"

                                            }

                                        }
                                        Rectangle{
                                            width: parent.width *20/100
                                            height: parent.height
                                            color: "transparent"

                                            Text {
                                                id: durationPlayerID
                                                text: "00:00"
                                                anchors.centerIn: parent
                                            }

                                        }

                                    }



                                }
                                Rectangle{

                                    width: parent.width
                                    height: parent.height/3*2
                                    // color: "gray"

                                    Row{
                                        height: parent.height
                                        spacing: 5
                                        anchors.centerIn: parent

                                        ShuffleButton{
                                            id: sfBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter: parent.verticalCenter
                                            onClicked: {
                                                console.log(statusShuffle)
                                            }
                                        }

                                        PreviousButton{
                                            id: preBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter:  parent.verticalCenter

                                        }

                                        BackwardButton{
                                            id: bwBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter:  parent.verticalCenter
                                        }


                                        PlayButton{
                                            id: playBtnID
                                            widthBtn: 50
                                            anchors.verticalCenter:  parent.verticalCenter
                                            visible: true

                                            onClicked: {

                                                if(sttPlayBtn){
                                                    console.log("Play=> pause")
                                                }
                                                else{
                                                    console.log("Pause=> play")
                                                }
                                            }
                                        }

                                        ForwardButton{
                                            id: fwBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter:  parent.verticalCenter

                                        }

                                        NextButton{
                                            id: nextBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter:  parent.verticalCenter
                                        }

                                        LoopButton{
                                            id: lpBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter: parent.verticalCenter

                                            onClicked: {

                                                console.log(sttLoopBtn)
                                            }
                                        }

                                    }
                                }
                            }

                            // ScrollBarMedia{
                            //     id: scb
                            //     withScrollbar: parent.width
                            //     heightScrollbar: 10
                            // }
                        }
                    }
                }
            }
        }

    }

    MouseArea{
        //760x400
    }

    onWidthChanged: {
        console.log("w: "+width)
        console.log("h: "+height)
    }
}
