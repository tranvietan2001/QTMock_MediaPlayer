import QtQuick 2.15
import QtQuick.Window 2.15
import "ComponentControl"

import SongModel 1.0
import MediaController 1.0

Window {
    width: 1390
    height: 750
    minimumWidth: 870
    minimumHeight: 400
    visible: true
    title: qsTr("Media Player")
    property int isStatusBtnTab: 0
    property int valVolumChanged: 50

    MediaController{
        id: songController
        // valVolume: 50


        onDurationChanged: {
            console.log("Main duration")
        }

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

                    Rectangle{
                        id: sttBtnHome
                        width: 5
                        height: parent.height
                        anchors.right: parent.right
                        color: "darkorange"
                        visible:  false
                    }

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/HomeView.qml"
                        isStatusBtnTab = 1;
                        console.log(isStatusBtnTab)

                        if(isStatusBtnTab == 1){
                            sttBtnHome.visible = true
                            sttBtnMusic.visible = false
                            sttBtnVideo.visible = false
                            sttBtnHistory.visible = false
                        }
                    }
                }

                TabButton{
                    id: musicTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Music List"
                    pathImg: "qrc:/ComponentControl/icon/playlist_b.png"

                    Rectangle{
                        id: sttBtnMusic
                        width: 5
                        height: parent.height
                        anchors.right: parent.right
                        color: "darkorange"
                        visible:  false
                    }

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/MusicList.qml"
                        isStatusBtnTab = 2;
                        console.log(isStatusBtnTab)
                        if(isStatusBtnTab == 2){
                            sttBtnHome.visible = false
                            sttBtnMusic.visible = true
                            sttBtnVideo.visible = false
                            sttBtnHistory.visible = false
                        }
                    }
                }

                TabButton{
                    id: videoTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "Video List"
                    pathImg: "qrc:/ComponentControl/icon/videolist_b.png"

                    Rectangle{
                        id: sttBtnVideo
                        width: 5
                        height: parent.height
                        anchors.right: parent.right
                        color: "darkorange"
                        visible:  false
                    }

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/VideoList.qml"

                        isStatusBtnTab = 3;
                        console.log(isStatusBtnTab)
                        if(isStatusBtnTab == 3){
                            sttBtnHome.visible = false
                            sttBtnMusic.visible = false
                            sttBtnVideo.visible = true
                            sttBtnHistory.visible = false
                        }
                    }
                }
                TabButton{
                    id: historyTabBtnID
                    widthBtn: parent.width
                    heightBtn: 30
                    nameBtn: "History"
                    pathImg: "qrc:/ComponentControl/icon/history_b.png"

                    Rectangle{
                        id: sttBtnHistory
                        width: 5
                        height: parent.height
                        anchors.right: parent.right
                        color: "darkorange"
                        visible:  false
                    }

                    onClicked: {
                        loaderViewAreaID.source = "qrc:/GUI/HistoryView.qml"

                        isStatusBtnTab = 4;
                        console.log(isStatusBtnTab)
                        if(isStatusBtnTab == 4){
                            sttBtnHome.visible = false
                            sttBtnMusic.visible = false
                            sttBtnVideo.visible = false
                            sttBtnHistory.visible = true
                        }
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

                    Connections{
                        target: loaderViewAreaID.item
                        function onMessage(path){
                            console.log("PATH: " + path)
                            songController.pathFilesSongCtr = path
                            // var index = idx
                            // console.log("INDEX: " + index)
                            // songController.indexPlay = 0
                            songController.playSong()
                        }
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
                                    color: "transparent"

                                    Rectangle{
                                        width: parent.width -20
                                        height: width
                                        anchors.centerIn: parent
                                        radius: width/2 - 2
                                        color: "darkcyan"
                                        Image{
                                            id: imgInforMediaID
                                            anchors.fill: parent
                                            source: "qrc:/ComponentControl/img/playerMusic.png"
                                            smooth: true
                                        }
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
                                    Text {
                                        text: songController.titleNameFile()
                                    }
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
                                                widthProgressBar: parent.width
                                                heightProgressBar: 10
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
                                                // text: "00:00"
                                                text: formatTime(songController.duration)
                                                anchors.centerIn: parent

                                                MouseArea{
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        console.log(songController.duration)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                Rectangle{

                                    width: parent.width
                                    height: parent.height/3*2
                                    color: "gray"

                                    Row{
                                        anchors.fill: parent

                                        Rectangle{
                                            width: parent.width / 10 * 8
                                            height: parent.height
                                            color: "blue"
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

                                        Rectangle{
                                            width: parent.width /10 * 2 - 10
                                            height: parent.height
                                            color: "cyan"


                                            MediaProgressBar{
                                                id: valVolumID
                                                widthProgressBar: parent.width
                                                heightProgressBar: 10
                                                sizePoint: 20
                                                colorTimeLine: "darkcyan"
                                                colorPoint: "darkorange"
                                                positionPoint: widthProgressBar/2
                                                anchors.centerIn: parent

                                                onExited: {
                                                    resumPlay()
                                                }
                                                onPositionChanged: {
                                                    resumPlay()
                                                }

                                            }

                                            Text {
                                                id: txtVolumID
                                                text: valVolumChanged
                                                anchors.centerIn: parent
                                                font.pixelSize: 20
                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }
                }

            }


            //    Timer {
            //        interval: 1000 // 1 giây
            //        running: true
            //        repeat: true

            //        onTriggered: {
            //            songController.processListData()
            //            console.log("====> update <====")
            //            // running = false; // Dừng Timer
            //            // destroy(); // Giải phóng bộ nhớ
            //        }
            //    }

            MouseArea{
                //760x400
            }

            onWidthChanged: {
                console.log("w: "+width)
                console.log("h: "+height)
            }



        }

    }

    function formatTime(duration) {
        var minutes = Math.floor(duration / 60000)
        var seconds = Math.floor((duration % 60000) / 1000)
        return minutes + ":" + (seconds < 10 ? "0" : "") + seconds
    }


    function resumPlay(){
        // valVolumChanged = valVolumID.positionPoint *100 / parent.width
        valVolumChanged = valVolumID.positionPoint / (valVolumID.widthProgressBar / 100)
        songController.valVolume = valVolumChanged
        var position = progressPlayerID.positionPoint * songController.duration / progressPlayerID.widthProgressBar
        // // playMusic.()
        songController.playMusicAtPosition(position)

        // console.log("C++: "+playMusic.sendDataCppToQml())
        console.log(songController.valVolume)
    }
}
