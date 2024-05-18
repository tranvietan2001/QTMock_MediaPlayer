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
    property string pathFileData: ""
    property string pathFolderData: ""
    property int idx: -1
    property string splitStrings: ""

    MediaController{
        id: songController
        // valVolume: 50

        // //logSongPosition() - cpp => vị trí nhạc tại thời điểm đang chạy so với duration của bài
        onPositionChanged:  {
            positionPlayerID.text = formatTime(position)
            let positionP = 0
            if(duration !== 0)
                positionP = position*progressPlayerID.width/duration
            progressPlayerID.positionPoint = positionP
        }

        onLogTitleNameChanged: {
            console.log("LOG TITLE: " + title)
            titleFilePlayerID.text = title
        }

        onLogArtistNameChanged: {
            console.log("LOG ARTIST: " + artist)
            artistFilePlayerID.text = qsTr("Artist: ") +  artist
        }

        onLogAlbumNameChanged: {
            console.log("LOG ALBUM: " + album)
            albumFilePlayerID.text = qsTr("Album: ") + album
        }

        onValVolumeChanged: {
            console.log("=========> VOLUM: " + songController.valVolume)
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
            color: "#ECECEC"
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
                        visible:  true
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

                            songController.pathFileSongCtr = path
                            songController.logInforData()
                        }
                    }
                }

                Rectangle{
                    id:itemControlMediaID
                    width: parent.width
                    height: 100
                    color: "transparent"
                    visible: true

                    Row{
                        // spacing: 2
                        Rectangle {
                            id: inforMediaID
                            color: "transparent";
                            border{
                                color: "#ECECEC"
                                width: 2
                            }
                            radius: 8

                            width: itemControlMediaID.width/4 < 270 ? 270: itemControlMediaID.width/4
                            height: itemControlMediaID.height

                            Row{
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
                                        color: "#ECECEC"
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

                                Column{
                                    width: inforMediaID.width - imgInforMediaID.width
                                    Rectangle{
                                        id: recTitleID
                                        width: parent.width
                                        height: 50
                                        color: "transparent"
                                        border.width: 1
                                        border.color: "#ECECEC"
                                        Text {
                                            id: titleFilePlayerID
                                            text: ""
                                            font.pixelSize: 16
                                            font.bold: true
                                            anchors.verticalCenter: parent.verticalCenter


                                            SequentialAnimation {
                                                id: titleTextAnimation
                                                loops: Animation.Infinite

                                                PropertyAnimation {
                                                    target: titleFilePlayerID
                                                    property: "x"
                                                    from: recTitleID.width
                                                    to: -titleFilePlayerID.contentWidth
                                                    duration: 10000
                                                    easing.type: Easing.Linear
                                                }

                                                PropertyAnimation {
                                                    target: titleFilePlayerID
                                                    property: "x"
                                                    from: -titleFilePlayerID.contentWidth
                                                    to: recTitleID.width
                                                    duration: 0
                                                }
                                            }

                                            Component.onCompleted: {
                                                if (titleFilePlayerID.contentWidth > recTitleID.width) {
                                                    titleTextAnimation.start()
                                                }
                                            }


                                        }
                                    }
                                    Rectangle{
                                        width: parent.width
                                        height: 50
                                        color: "transparent"
                                        border.width: 1
                                        border.color: "#ECECEC"
                                        Column{
                                            anchors.fill: parent
                                            Text {
                                                id: artistFilePlayerID
                                                text: ""
                                            }
                                            Text {
                                                id: albumFilePlayerID
                                                text: ""
                                            }
                                        }
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
                                                colorTimeLine: "darkcyan"
                                                colorPoint: "darkorange"

                                                onExited: {
                                                    resumPlay()
                                                }

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
                                                            songController.pauseSong()
                                                        }
                                                        else{
                                                            console.log("Pause=> play")
                                                            songController.playSong()
                                                            // resumPlay()
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

            // onWidthChanged: {
            //     console.log("w: "+width)
            //     console.log("h: "+height)
            // }



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
        // songController.playMusicAtPosition(position)

        // console.log("C++: "+playMusic.sendDataCppToQml())
        console.log(songController.valVolume)
    }
}
