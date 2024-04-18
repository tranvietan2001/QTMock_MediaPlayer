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
                        spacing: 2
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
                                spacing: 1

                                Rectangle{
                                    width: parent.width
                                    height: parent.height/3
                                    color: "gray"
                                }
                                Rectangle{

                                    width: parent.width
                                    height: parent.height/3*2
                                    // color: "gray"

                                    Row{
                                        height: parent.height
                                        spacing: 3
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

                                                // console.log(sttLoopBtn)
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
