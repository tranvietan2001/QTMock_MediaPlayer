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

                    PlayButton{
                        withBtn: 50

                    }
                }
                Rectangle{
                    id:itemControlMediaID
                    width: parent.width
                    height: 100
                    color: "springgreen"
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

                            ScrollBarMedia{
                                id: scb
                                withScrollbar: parent.width
                                heightScrollbar: 10
                            }
                        }
                    }
                }
            }
        }

    }

    onWidthChanged: {
        console.log(width)
        console.log(height)
    }

}
