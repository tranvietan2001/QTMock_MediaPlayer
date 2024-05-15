import QtQuick 2.15
// import Qt.labs.folderlistmodel 2.15
import QtQuick.Dialogs 1.3

import SongModel 1.0
// import MediaController 1.0

Item {
    id: homeView
    property bool isCheckLoadModel: false
    property string bgTitleColor: "darkcyan"
    property string txtTitleColor: "darkorange"
    property string txtColorO: "darkorange"
    property string txtColorB: "black"
    property int contentYMax: 0

    // MediaController{
    //     id: songController
    // }

    SongModel{
        id: songModelCpp
        onPathFolderSongChanged:  {
            console.log("LIST FILES MP3 IN FORDER")
            isCheckLoadModel = true
        }

        onPathFilesSongChanged: {
            console.log("LIST FILES MP3")
            isCheckLoadModel = true
        }

    }

    Rectangle{
        id: bgViewID
        anchors.fill: parent
        color: "transparent"

        Rectangle{
            id: titleList
            width: parent.width
            height: 30
            color: "#D3D3D3"
            visible: isCheckLoadModel ? songModelCpp : 0

            Row{
                spacing: 1
                anchors.fill: parent
                Rectangle{
                    id: indexTitleList
                    width: parent.width / 16
                    height: parent.height
                    color: "darkcyan"
                    Text {
                        id: indexList
                        text: qsTr("Index")
                        color: "darkorange"
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                Rectangle{
                    id: titleTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: bgTitleColor
                    Text {
                        id: titleMedia
                        text: qsTr("Title")
                        color: txtTitleColor
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                Rectangle{
                    id: artistTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: bgTitleColor
                    Text {
                        id: artistMedia
                        text: qsTr("Artist")
                        color: txtTitleColor
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                Rectangle{
                    id: albumTitleList
                    width: parent.width / 16 * 3
                    height: parent.height
                    color: bgTitleColor
                    Text {
                        id: albumMedia
                        text: qsTr("Album")
                        color: txtTitleColor
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                Rectangle{
                    id: durationTitleList
                    width: parent.width / 16
                    height: parent.height
                    color: bgTitleColor
                    Text {
                        id: durationMedia
                        text: qsTr("Duration")
                        color: txtTitleColor
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
                Rectangle{
                    id: pathTitleList
                    width: parent.width / 16 * 5
                    height: parent.height
                    color: bgTitleColor
                    Text {
                        id: pathMedia
                        text: qsTr("Path")
                        color: txtTitleColor
                        font.bold: true
                        font.pixelSize: 16
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                }
            }
        }

        ListView{
            id: listViewSong
            width: parent.width
            height: parent.height - 30
            y: 30
            model: isCheckLoadModel ? songModelCpp : 0
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            visible: isCheckLoadModel ? songModelCpp : 0

            delegate: Rectangle{
                id: dlgList
                width: indexTitleList.width + titleTitleList.width + artistTitleList.width + albumTitleList.width + durationTitleList.width + pathTitleList.width
                height: 50
                color: "transparent"
                border.width: 1
                border.color: txtColorO

                Row{
                    anchors.fill: parent
                    spacing: 2
                    Rectangle{
                        width: indexTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: idxT
                            text: index+1
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }

                    Rectangle{
                        width: titleTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: tilT
                            // text: "titleName"
                            text: title
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }

                    Rectangle{
                        width: artistTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: artT
                            // text: "artname"
                            text: artist
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }

                    Rectangle{
                        width: albumTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: albT
                            // text: "album"
                            text: album
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }

                    Rectangle{
                        width: durationTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: durT
                            // text: "duration"
                            text: duration
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }

                    Rectangle{
                        width: pathTitleList.width
                        height: parent.height
                        color: "transparent"
                        Text {
                            id: pathT
                            // text: "path"
                            text: file
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    // propagateComposedEvents: true

                    onClicked: {
                        console.log("=========================")
                    }

                    onEntered: {
                        dlgList.color = "darkcyan";
                        idxT.color = tilT.color = artT.color = albT.color = durT.color = pathT.color = txtColorO
                        idxT.font.bold = tilT.font.bold = artT.font.bold = albT.font.bold = durT.font.bold = pathT.font.bold = true

                        contentYMax = listViewSong.contentHeight - listViewSong.height
                        if(contentYMax < listViewSong.height)
                            scrollArea.visible = false
                        else
                            scrollArea.visible = true
                    }

                    onExited: {
                        dlgList.color = "transparent";
                        idxT.color = tilT.color = artT.color = albT.color = durT.color = pathT.color = txtColorB
                        idxT.font.bold = tilT.font.bold = artT.font.bold = albT.font.bold = durT.font.bold = pathT.font.bold = false


                        scrollArea.visible = false
                    }

                    onPressed: {
                        dlgList.scale = 1.05
                    }

                    onReleased: {
                        dlgList.scale = 1
                    }
                }
            }
            onContentYChanged: {
                // console.log("content Y: " + listViewSong.contentY)
                //  console.log("content Height: " + listViewSong.contentHeight)
                contentYMax = listViewSong.contentHeight - listViewSong.height
                // console.log("max content Y: " + contentYMax)

                var positionPoint = (contentY * scrollArea.height / contentYMax)
                if (positionPoint > scrollArea.height -scrollPoint.height) positionPoint = positionPoint - scrollPoint.height
                scrollPoint.y = positionPoint

            }

            // MouseArea{
            //     anchors.fill: parent
            //     hoverEnabled: true
            //     propagateComposedEvents: true

            //     onEntered: {
            //         contentYMax = listViewSong.contentHeight - listViewSong.height
            //         if(contentYMax < listViewSong.height)
            //             scrollArea.visible = false
            //         else
            //             scrollArea.visible = true
            //     }

            //     onExited: {
            //         scrollArea.visible = false
            //     }

            // }

        }


        Rectangle{
            id: scrollArea
            width: 10
            height: listViewSong.height
            y: listViewSong.y
            color: "darkcyan"
            anchors.right: parent.right
            // opacity: 0.5
            radius: width/2
            visible: false

            Rectangle{
                id: scrollPoint
                width: parent.width
                height: 40
                color: "darkorange"
                radius: width/2


            }

            MouseArea{
                anchors.fill: parent
                drag.target: scrollPoint
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: scrollArea.height -  scrollPoint.height

                onClicked: {
                    listViewSong.contentY = mouseY
                }

                onPositionChanged: {
                    let y = mouseY
                    if (y > (listViewSong.height -  scrollPoint.height))
                        y = listViewSong.height
                    if(y<0) y = 0
                    var scrollRatio = y / scrollArea.height
                    console.log("y:" + y)
                    listViewSong.contentY = scrollRatio * (listViewSong.contentHeight - listViewSong.height)
                    console.log("lvp: " + (scrollRatio * scrollArea.height))
                }
            }
        }



        Rectangle{
            id: areaBtn
            width: parent.width
            height: 60
            y: parent.height - height
            color: "transparent"
            // visible: listViewSong > 0 ? true: false
            visible: true

            Row{
                spacing: 20
                anchors.centerIn: parent
                Rectangle{
                    id: openFilesBtn
                    width: 120
                    height: 40
                    radius: 5
                    color: "darkcyan"

                    Text {
                        id: openFilesTxt
                        text: qsTr("Open Files")
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            console.log("Open File(s)")
                            fileDialog1.open()
                        }

                        onEntered: {
                            openFilesBtn.color = "darkorange"
                            openFilesTxt.color = "white"
                        }

                        onExited: {
                            openFilesBtn.color = "darkcyan"
                            openFilesTxt.color = "black"
                        }
                    }

                }
                Rectangle{
                    id: openFolderBtn
                    width: 120
                    height: 40
                    radius: 5
                    color: "darkcyan"

                    Text {
                        id: openFolderTxt
                        text: qsTr("Open Folder")
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            console.log("Open Folder")
                            fileDialog2.open()
                        }
                        onEntered: {
                            openFolderBtn.color = "darkorange"
                            openFolderTxt.color = "white"
                        }

                        onExited: {
                            openFolderBtn.color = "darkcyan"
                            openFolderTxt.color = "black"
                        }
                    }
                }
            }
        }


        FileDialog {
            id: fileDialog1
            title: "Select Files"
            nameFilters: "*.mp3"
            selectMultiple: true
            folder: shortcuts.home

            onAccepted: {
                var path = fileUrls.toString()
                console.log("have select path")
                console.log("=============>" + path)
                songModelCpp.pathFilesSong = path
            }
            onRejected: {
                console.log("Cancel")
            }
        }

        FileDialog {
            id: fileDialog2
            title: "Select Folder"
            selectFolder: true
            folder: shortcuts.home

            onAccepted: {
                var path = fileUrl.toString().replace("file://", "");
                console.log("have select path")
                console.log("=============>" + path)
                songModelCpp.pathFolderSong = path
            }
            onRejected: {
                console.log("Cancel")
            }
        }

    }
}
