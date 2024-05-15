import QtQuick 2.15
import QtQuick.Window 2.15
import "ComponentControl"

import SongModel 1.0
import MediaController 1.0

Window {
    width: 1390
    height: 750
    minimumWidth: 760
    minimumHeight: 400
    visible: true
    title: qsTr("Media Player")

    MediaController{
        id: songController
    }

    SongModel{
        id: songModel
    }


    Row{
        id: rowViewID
        anchors.fill: parent
        spacing: 2

        Rectangle{
            id: recTab
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

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/HomeView.qml"
                    }
                }

                TabButton{
                    id: musicTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Music List"
                    pathImg: "qrc:/ComponentControl/icon/playlist_b.png"

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/MusicList.qml"
                    }
                }

                TabButton{
                    id: videoTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Video List"
                    pathImg: "qrc:/ComponentControl/icon/videolist_b.png"
                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/VideoList.qml"
                    }
                }
                TabButton{
                    id: historyTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "History"
                    pathImg: "qrc:/ComponentControl/icon/history_b.png"

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/HistoryView.qml"
                    }
                }
            }
        }

        Rectangle{
            id: viewMediaId
            width: parent.width - recTab.width
            height: parent.height
            // visible: true

            Column{
                spacing: 2
                anchors.fill: parent
                Rectangle{
                    id: viewArea
                    width: parent.width
                    height: parent.height - itemControlMediaID.height
                    // border.width: 5
                    // border.color: "black"
                    Loader{
                        id: loaderViewAreaID
                        anchors.fill: viewArea
                        source: "qrc:/GUI/HomeView.qml"
                    }
                }

                Rectangle{
                    id:itemControlMediaID
                    width: parent.width
                    height: 100
                    color: "springgreen"
                    visible: true

                    Row{
                        // spacing: 2
                        Rectangle {
                            id: inforMediaID
                            color: "transparent";
                            width: itemControlMediaID.width/3
                            height: itemControlMediaID.height

                            Row{
                                spacing: 1

                                Rectangle{

                                    width: inforMediaID.height
                                    height: width
                                    radius: width/2 - 2
                                    color: "darkcyan"

                                    Image{
                                        id: imgInforMediaID
                                        width: parent.width -20
                                        height: width
                                        anchors.centerIn: parent
                                        source: "qrc:/ComponentControl/img/playerMusic.png"
                                        smooth: true
                                    }

                                    RotationAnimation {
                                        id: rotationAnim
                                        target: imgInforMediaID
                                        property: "rotation"
                                        from: 0
                                        to: 360
                                        duration: 2000  // Thời gian hoàn thành một vòng xoay (ms)
                                        running: true // ==>play -> true, stop-> false
                                        loops: Animation.Infinite  // Lặp vô hạn
                                    }

                                }

                                Rectangle{
                                    width: inforMediaID.width - imgInforMediaID.width
                                    height: 50
                                    color: "gray"
                                }
                            }
                        }

                        Rectangle {
                            id: controlMediaID
                            // color: "green";
                            width: itemControlMediaID.width - inforMediaID.width
                            height: itemControlMediaID.height

                            Column{
                                anchors.fill: parent

                                Rectangle{
                                    width: parent.width
                                    height: parent.height/3
                                    // color: "gray"

                                    Row{
                                        width: parent.width
                                        height: parent.height
                                        spacing: 3
                                        Rectangle{
                                            width: parent.width *15/100
                                            height: parent.height
                                            color: "transparent"

                                            Text {
                                                id: positionPlayerID
                                                text: "00:00"
                                                anchors.centerIn: parent
                                            }

                                        }
                                        Rectangle{
                                            width: parent.width *70/100
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
                                            width: parent.width *15/100
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

                                                console.log(viewMediaId.width + "====" + viewMediaId.height)
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

                                            onClicked: {
songModel.updateModel()
                                            }

                                        }

                                        NextButton{
                                            id: nextBtnID
                                            widthBtn: 40
                                            anchors.verticalCenter:  parent.verticalCenter
                                            onClicked: {
                                                // if load view nào thì điêuf khiển song hay video
                                                songController.processListData()
                                            }
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


    Timer {
        interval: 1000 // 1 giây
        running: true
        repeat: true

        onTriggered: {
            songController.processListData()
            console.log("====> update <====")
            // running = false; // Dừng Timer
            // destroy(); // Giải phóng bộ nhớ
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
